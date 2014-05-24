module TasksHelper

	# Get and returns parameters from the environment object
	def _get_params_from_environment(*params)
		object = {}
		params.each do |param|
			object[param] = ENV[param.to_s]
		end

		object
	end

end
