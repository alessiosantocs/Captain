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

	# Here we go with the api
	namespace :api, defaults: {format: 'json'} do
		namespace :v1 do
			resources :deployments do
				get 'test' => 'deployments#create'
			end

			resources :deployable_applications do
				patch 'activate' => 'deployable_applications#activate'
			end
		end
	end


	root :to => "deployable_applications#index"

end
