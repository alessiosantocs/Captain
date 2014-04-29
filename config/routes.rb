Deploydapp::Application.routes.draw do
	# Devise stuff
	devise_for :users

	# The list of your deployments
	resources :deployments

	# OAuth callback function
	get '/auth/:provider/callback' => "authentications#create"

	# Authentications controller routes
	resources :authentications



	root :to => "deployments#index"

end
