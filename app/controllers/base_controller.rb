class BaseController < ApplicationController
	include ApplicationHelper
	include RedirectsHelper
	include ValidatorHelper

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_filter :handle_automated_redirects
end
