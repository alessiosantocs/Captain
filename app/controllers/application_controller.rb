class ApplicationController < ActionController::Base
	before_filter :set_resource, only: [:show, :update, :deleter, :edit]

	include FindHelper

	# DECLARE THE METHODS FINDER METHODS
	FINDABLE_MODELS.each do |model|
		define_method("find_" + model.to_s.tableize.singularize + "_by") do |colums, *args|
			obj = model.send(("find_by_" + colums).to_sym, args)
			raise ActiveRecord::RecordNotFound if obj.nil?

			return obj
		end
	end


	def set_resource
		# search the resource by id
		resource_name			= params[:controller].singularize

		if resource_name.present?
			@fetched_resource 	= self.send("find_#{resource_name}_by", "id", params[:id])

			# instance the resource variable with the name of his model
			instance_variable_set("@#{resource_name}".to_sym, @fetched_resource)
		end
	end
end
