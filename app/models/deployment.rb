class Deployment < ActiveRecord::Base
	
	# For now each user has many deployments and one app
	belongs_to :user

	# The application the user is deploying
	belongs_to :deployable_application

	def repo_name
		match :repo_name
	end

	def repo_owner
		match :repo_owner
	end

	private
		def match(value)
			response = nil

			# REGEX => ^https?:\/\/(\w+)@(\w+)\.(org|it|com|net)\/(\w+)\/([\w\.]+).(git)$
			# 			1. Repo user
			# 			2. Provider (github, bitbucket etc.)
			# 			3. Domain
			# 			4. Repo owner
			# 			5. Repo name
			# 			6. Extension (git or others)

			regex = /^https?:\/\/(\w+)@(\w+)\.(org|it|com|net)\/(\w+)\/([\w\.]+).(git)$/

			result = regex.match repo

			response = result[1] 				if value == :repo_user
			response = result[2] 				if value == :repo_provider
			response = result[2] + result[3] 	if value == :repo_provider_domain
			response = result[4] 				if value == :repo_owner
			response = result[5] 				if value == :repo_name
			response = result[6] 				if value == :repo_extension

			response
		end
end
