class PullRequest < ActiveRecord::Base
	# Each deploy is composed of pull requests
	belongs_to :deployment

	attr_accessor :var_additional_info

	# Make a query to bitbucket and get information for this pull request
	def additional_info
		result = nil
		unless var_additional_info.present?
			user = deployment.deployable_application.user
			client = user.scm_client
			var_additional_info = client.pull_requests.get(deployment.deployable_application.repo_owner, deployment.deployable_application.repo_name, pid)
			puts "FUCK"
		end

		result = var_additional_info
	end

	def author
		additional_info.author
	end
end
