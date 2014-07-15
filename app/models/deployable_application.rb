class DeployableApplication < ActiveRecord::Base

	# It belongs to one and only one User
	belongs_to :user
	
	# Every deploy the user has made
	has_many :deployments

	has_many :configurations, as: :owner

	# Properties validation
	validates :name, uniqueness: true, presence: true
	validates :repo, presence: true
	validates :branch, presence: true

	# Filters
	after_create :generate_token

	def repo_name
		match :repo_name
	end

	def repo_owner
		match :repo_owner
	end

	def environment
		'production'
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

		# Generate a unique public token for accessing the api of this app
		def generate_token
			begin
				self.public_token = SecureRandom.hex(nil)
			end while DeployableApplication.find_by_public_token(self.public_token).present?
			
			self.save
		end

end
