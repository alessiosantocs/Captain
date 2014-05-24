namespace :pull_requests do
	desc "Lookup for pull requests from the repo source"

	# I will update all pull_requests for one user only
	# uid = current_user.authentications.first.uid
	# token = current_user.authentications.first.access_token
	# secret = current_user.authentications.first.token_secret
	# consumerkey = current_user.authentications.first.consumer_key
	# consumersecret = current_user.authentications.first.consumer_secret
	


	task :fetch => :environment do
		bitbucket = BitBucket.new do |config|
			config.oauth_token = token
			config.oauth_secret = secret

			config.client_id = consumerkey
			config.client_secret = consumersecret
		end

	end
end