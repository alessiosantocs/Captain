module RedirectsHelper

	KNOWN_CONTROLLERS = [:deployable_applications, :deployments, :authentications, :pull_requests]
	NEED_MORE_AUTHENTICATION = 'You will need to authenticate'

	# Get and returns parameters from the environment object
	def handle_automated_redirects
		# No current user methods here

		# authenticate_user!
		# Current user required here
		if current_user.present?
			handle_no_authentication_redirect
			handle_no_deployable_application_redirect
			handle_force_single_application_management_redirect
		end
	end

	# No authentication? get one
	def handle_no_authentication_redirect
		if controller_is? :authentications and action_is? [:index, :edit, :show] 
			if current_user.authentications.empty?
				redirect_to new_authentication_path
			end
		end
	end

	# No deployable application? get one
	def handle_no_deployable_application_redirect
		unless controller_is? [:deployable_applications, :authentications]
			if controller_is? KNOWN_CONTROLLERS
				if current_user.deployable_applications.empty?
					redirect_to new_deployable_application_path, notice: 'Let\' create an application'
				end
			end
		end
	end

	def handle_force_single_application_management_redirect
		# Does the user have any application
		if controller_is? "deployable_applications" and action_is? [:index, :edit, :show] 
			if current_user.deployable_applications.any?
				# if yes redirect to the first application of the user
				redirect_to deployable_application_url current_user.deployable_applications.first if params[:action] != 'show'
			else
				# if no make him create a new one
				redirect_to new_deployable_application_url if params[:action] != 'new'
			end
		end
	end

	# Check if the user has an scm association
	def scm_associate_user!
		if current_user.present?
			if current_user.authentications.empty?
				redirect_to authentications_url, :alert => NEED_MORE_AUTHENTICATION
			end
		end
	end

end
