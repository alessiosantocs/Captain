
# Initializer for omniauth
Rails.application.config.middleware.use OmniAuth::Builder do
	
	# Just foursquare
	# provider :foursquare, ENV['FOURSQUARE_KEY'], ENV['FOURSQUARE_SECRET']
	provider :bitbucket, 'JL3V9K5WbQDW5YkCsp', 'sxrreXwrd9tJBmpYcetaPt8h9cU2ezzF'
	provider :github, 'a629078fe34e0a1af69a', '716fddaf86d390667611eb734fe7b1e2b489f967'
	
end

