module TasksHelper


	def log(message)
		puts "Captain says: #{message}"
	end

	# Get and returns parameters from the environment object
	# Usage:
	# 		_get_params_from_environment :APP_ID, ...
	# Or if you pass an array as a single object:
	# 		_get_params_from_environment [:APP_ID, <Fallback value>], [:ENV_TYPE, <Fallback value>] ...

	def _get_params_from_environment(*params)
		object = {}
		params.each do |param|

			key = param

			if param.kind_of? Array
				key = key[0]
			end

			object[key] = ENV[key.to_s]

			if param.kind_of? Array
				object[key] ||= param[1]
			end
		end

		object
	end

end
