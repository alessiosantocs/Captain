class Api::V1::BaseController < ApplicationController
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :null_session

	respond_to :json

	rescue_from ActiveRecord::RecordNotFound, :with => :not_found

	private
		def not_found
			render json: {error: "resouce not found"}, status: 404
		end
end
