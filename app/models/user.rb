class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise  :database_authenticatable, :registerable,
			:recoverable, :rememberable, :trackable, :validatable

	# RepoManagement Authentication services
	has_many :authentications
	# He can deploy and register many applications
	has_many :deployable_applications

	has_many :configurations, as: :owner

	# Signup with omniauth
	def apply_omniauth(omniauth)
		# Use the email provided by omniauth if the user does not have one
		# self.first_name = omniauth_user_info(omniauth)['first_name'] if first_name.blank?
		# self.last_name = omniauth_user_info(omniauth)['last_name'] if last_name.blank?
		# self.email = omniauth_user_info(omniauth)['email'] if email.blank?

		provider      		= omniauth.provider
		uid           		= omniauth.uid
		access_token  		= omniauth.credentials.token
		token_secret  		= omniauth.credentials.secret
		consumer_key  		= ""
		consumer_secret  	= ""

		if provider == "bitbucket"
			consumer_key = omniauth.extra.access_token.consumer.key
			consumer_secret = omniauth.extra.access_token.consumer.secret
		end


		# Build an authentication on the fly
		authentications.build(:provider => provider, 
								:uid => uid, 
								:access_token => access_token,
								:token_secret => token_secret,
								:consumer_key => consumer_key,
								:consumer_secret => consumer_secret)
	end


	# Right now it is only bitbucket 
	def scm_client
		uid = authentications.first.uid
		token = authentications.first.access_token
		secret = authentications.first.token_secret
		consumerkey = authentications.first.consumer_key
		consumersecret = authentications.first.consumer_secret

		bitbucket = BitBucket.new do |config|
			config.oauth_token = token
			config.oauth_secret = secret

			config.client_id = consumerkey
			config.client_secret = consumersecret
		end

		return bitbucket

	end

	# Rewrite the method inherited from devise
	def password_required?
		(authentications.empty? || !password.blank?) && super
	end

	# A simple method to get the profile name
	def profile_name
		email.split("@")[0] # first_name || last_name || 
	end
	
	def set_configurations(values)
		values.each do |hash|
			config = configurations.where(:key, hash[:key]).first

			if config.nil?
				hash[:owner_id] = self.id
				hash[:owner_type] = self.class.to_s

				configurations.create(hash)
			else
				config.update_attributes(value: hash[:value])
			end
		end
	end


end
