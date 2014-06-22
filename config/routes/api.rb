
# Api namespace
namespace :api, defaults: {format: 'json'} do
	namespace :v1 do
		resources :deployments do
			get 'test' => 'deployments#create'
		end

		resources :deployable_applications do
			put 'activate' => 'deployable_applications#activate'
		end
	end
end