class GeneralSettingsController < BaseController

	def show
		@general_settings = {
			title: params[:id].capitalize
		}
	end

	def update
		@user = current_user

		send(params[:settings_type] + '_settings')
	end

	private
		def paperwork_settings
			configurations = params[:user][:configurations]
			configurations = configurations.map_pair{|key, value| {key: key, value: value}}

			configurations = @user.set_configurations(configurations)
		end

		def set_resource
			if private_methods.select{|method_name| method_name.to_s.index(/#{params[:id]}_settings$/).nil? }.empty?
				not_found
			end
		end
end
