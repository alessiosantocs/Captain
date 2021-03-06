class Api::V1::BaseController < ApplicationController
	include ExceptionsHelper
	include ValidatorHelper

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :null_session

	before_filter :check_token

	respond_to :json

	rescue_from ActiveRecord::RecordNotFound, with: :not_found
	rescue_from HTTPUnauthorized, with: :unauthorized

	private
		def not_found
			render json: {error: "resouce not found"}, status: :not_found
		end

		def unauthorized
			render json: {error: "unauthorized"}, status: :unauthorized
		end

		def check_token
			raise HTTPUnauthorized if params[:public_token]
		end
end
