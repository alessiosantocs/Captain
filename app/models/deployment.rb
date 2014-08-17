class Deployment < ActiveRecord::Base
	
	# For now each user has many deployments and one app
	belongs_to :user

	# The application the user is deploying
	belongs_to :deployable_application

	# Has many associated pull requests
	has_many :pull_requests

	# Returns the title and if no title has been added returns a fallback
	def title
		self[:title] || "Deployment ##{id}"
	end

	# Returns the description and if no description has been added returns a fallback
	def description
		self[:description] || "No description added"
	end

	# Returns the author of the deploy and if no author has been added returns a fallback
	def author_name
		self[:author_name] || "Someone"
	end

	def author_email=(email)
		self[:author_email] = email.gsub("\n", "")
	end

	def has_author?
		self[:author_name].present?
	end

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
