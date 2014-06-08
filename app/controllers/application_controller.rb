class ApplicationController < ActionController::Base
	include FindHelper

	# DECLARE THE METHODS FINDER METHODS
	FINDABLE_MODELS.each do |model|
		define_method("find_" + model.to_s.tableize.singularize + "_by") do |colums, *args|
			obj = model.send(("find_by_" + colums).to_sym, args)
			raise ActiveRecord::RecordNotFound if obj.nil?
		end
	end

end
