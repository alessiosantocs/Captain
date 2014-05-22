Deploydapp::Application.routes.draw do
	# Devise stuff
	devise_for :users

	# The list of your deployments
	resources :deployments

	# OAuth callback function
	get '/auth/:provider/callback' => "authentications#create"

	# Authentications controller routes
	resources :authentications


	# Here we go with the api
	namespace :api, defaults: {format: 'json'} do
		namespace :v1 do
			resources :deployments
		end
	end


	root :to => "deployments#index"

end
