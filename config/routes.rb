
Deploydapp::Application.routes.draw do
	# Devise stuff
	devise_for :users

	# The list of your deployments
	resources :deployments do
		resources :pull_requests
	end

	# OAuth callback function
	get '/auth/:provider/callback' => "authentications#create"

	# Authentications controller routes
	resources :authentications

	# DeployableApplications controller routes
	resources :deployable_applications do 
		resources :deployments
	end

	# Include api routes
	draw :api

	root :to => "deployable_applications#index"

end