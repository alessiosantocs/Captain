namespace :pull_requests do


	desc "Fetch new pull requests from the scm of a single app"
	task :fetch_for_app => :environment do
		
		# Helper tool to validate things
		include ValidatorHelper
		include TasksHelper

		params = _get_params_from_environment :PUBLIC_TOKEN, :APP_ID, :DEPLOYMENT_ID
		_validate_presence_of_hash(params)

		options = _get_params_from_environment :FORCE_REWRITE

		# START SETUP
		
		# Get the app through rake's parameters
		user_app = DeployableApplication.find_by_id(params[:APP_ID])
		_validate_presence_of user_app

		# Get the current deployment
		app_deployment = user_app.deployments.find_by_id(params[:DEPLOYMENT_ID])
		_validate_presence_of app_deployment

		# Get the owner of the app
		user = user_app.user
		_validate_presence_of user

		# Refactor these lines
		uid = user.authentications.first.uid
		token = user.authentications.first.access_token
		secret = user.authentications.first.token_secret
		consumerkey = user.authentications.first.consumer_key
		consumersecret = user.authentications.first.consumer_secret

		bitbucket = BitBucket.new do |config|
			config.oauth_token = token
			config.oauth_secret = secret

			config.client_id = consumerkey
			config.client_secret = consumersecret
		end

		# END SETUP


		# Initialize a query object and a pagecount counter
		query = nil
		pagecount = 1
		buffersize = 50
		forcefinish = false
		found_any = false

		begin

			# Make a call to bitbucket
			puts "Fetching Page ##{pagecount}"
			query = bitbucket.pull_requests.list_repo user_app.repo_owner, user_app.repo_name, state: 'MERGED', sort: '-updated_on', pagelen: buffersize, page: pagecount

			# Loop each pull request in the response
			# TODO: Change this [2] behavior
			query.values[2].each do |pull_request|
				pid 		= pull_request.id
				title 		= pull_request.title
				created_on 	= pull_request.created_on
				merged_on 	= pull_request.updated_on
				description = pull_request.description

				# Lookup for an existent pull request on the database
				db_pull_request = PullRequest.find_by_pid(pid)

				if db_pull_request.present?
					forcefinish = true
					puts "Nothing to update"
					break unless options[:FORCE_REWRITE]
				else
					found_any = true
					
					app_deployment.pull_requests.create!(pid: pid, title: title, created_on: created_on, merged_on: merged_on, description: description)
					puts "SUCCESS: PR => Id #{pid}, Created on #{created_on}, Merged on #{merged_on}"
				end
			end

			pagecount += 1

		end while query.next.present? and query.next != "" and !forcefinish
		# Fetch all pages of pull requests until there is no 'next' page

		if user.configurations[:paperwork].try(:value) == "true"
			PaperworkMailer.deploy_notification(app_deployment).deliver
		end

		unless found_any
			puts "ROLLBACK: Deleting latest deployment because no pull requests where found"
			app_deployment.delete
		end

		puts "Rake ends."
	end
end