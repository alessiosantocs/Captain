module ApplicationHelper

	# Helper method to check controller and action

		def controller_or_action_are?(controller=nil, action=nil)
			controller_cond = true
			action_cond 	= true

			controller_cond = controller_is? 	if controller.present?
			action_cond 	= action_is? 		if action.present?

			controller_cond and action_cond
		end

		# Example => 	controller_is? :users 
		# 				controller_is? [:users, :authentications] # This is an OR condition
		def controller_is?(value)
			response = false
			current_value = params[:controller]

			if value.kind_of? Array
				value.each do |v|
					response = controller_is? v if response == false
				end
			else
				response = (current_value == value.to_s)
			end

			return response
		end

		# Example => 	action_is? :show 
		# 				action_is? [:show, :index, :new] # This is an OR condition
		def action_is?(value)
			response = false
			current_value = params[:action]

			if value.kind_of? Array
				value.each do |v|
					response = action_is? v if response == false
				end
			else
				response = (current_value == value.to_s)
			end

			return response
		end

	# =======

	# A simple function to generate an html title in the page
		def title(value="", options={})
			if block_given?
				return content_tag :div, :class => (options[:wrapper_class] || "page-header") do
					content_tag :h1 do
						yield
					end
				end
			else
				return content_tag :div, :class => (options[:wrapper_class] || "page-header") do
				 	content_tag(:h1, value)
				end
			end
		end
	# =======

	# A simple function to generate an html subtitle that should be positioned under the title
		def sub_title(value="", options={})
			if block_given?
				content_tag :p, :class => "lead" do
					yield
				end
			else
				content_tag(:p, value, :class => "lead")
			end
		end
	# =======

	# Generate a fast auth url for a given authentication name
		def auth_url(for_what, parameters="")
			parameters = "" if parameters.nil?

			if parameters != ""
				parameters = "?#{parameters.to_query}"
			end
			"/auth/#{for_what}#{parameters}"
		end
	# =======


	# View helper to generate the needed form stuff for the main button
		def btn_container
			if block_given?

				return content_tag :div, :class => "text-left" do
							content_tag :div, :class => "form-group row" do 
								concat (content_tag :div, "", :class => "col-lg-2")
								concat (content_tag :div, :class => "col-lg-10" do 
									yield
								end)
							end
						end
			end
		end
	# =======

	# View helper to control which classes to give to the body
		def body_classes
			"#{params[:controller].parameterize.underscore} #{params[:action]}"
		end
	# =======

	# Used to display the alert containing the errors of a form
	def display_errors!(resource)
		response = ""
		if resource.errors.any?
			response = content_tag :div, :class => "alert alert-danger" do 
				content_tag :p, :class => "text" do
					"#{pluralize(resource.errors.count, 'error')} prohibited this deployable_application from being saved:"
				end

				content_tag :ul do
					resource.errors.full_messages.each do |msg|
						content_tag :li, msg
					end
				end
			end
		end
	end

end
