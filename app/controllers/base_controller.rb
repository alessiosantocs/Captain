
class BaseController < ApplicationController
	
	enable_authorization do |exception|
		# raise if Rails.env.development?
		redirect_to new_user_session_url, :alert => "You're not authorized to see that page"
	end

	include ExceptionsHelper
	include ApplicationHelper
	include RedirectsHelper
	include ValidatorHelper

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_filter :handle_automated_redirects


	# Fallbacks
	rescue_from ActiveRecord::RecordNotFound, with: :not_found
	# rescue_from Faraday::ConnectionFailed, with: :return_nil	# => Connection failed, probably in local environment

	private
		def not_found
			redirect_to :root, alert: "Nothing like that has been found" and return
		end
end
