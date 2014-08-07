namespace :deployments do


	desc "Simulate a deployment"
	task :simulate_deployment => :environment do
		
		# Helper tool to validate things
		include ValidatorHelper
		include TasksHelper

		if Rails.env.development?

			params = _get_params_from_environment [:APP_ID, 1]
			_validate_presence_of_hash(params)

			# Retrieve the app
			deployable_application = DeployableApplication.find_by_id(params[:APP_ID])
			_validate_presence_of deployable_application

			# Add a deployment to the app
			app_deployment = deployable_application.deployments.create!(
				:repo => deployable_application.repo,
				:branch => deployable_application.branch,
				:environment => "production",
				:revision => "58d96fde3b671d64cc597ac45d7a56edc9dcecdf",
				:author_name => "Alessio Santo",
				:author_email => "alessio.santocs@gmail.com"
			)

			app_deployment.pull_requests.create!(
				:pid => 1,
				:title => "Fake pull request",
				:created_on => (Date.today - 1.days),
				:merged_on => Date.today
			)

			log "All done!"

		else
			log "This task is meant for development environment only!"
		end

	end

end