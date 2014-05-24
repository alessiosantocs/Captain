module ValidatorHelper

	PRESENCE_REQUESTED = "parameter cannot be nil"


	# Ensures that essential arguments are present before request is made
	#
	def _validate_presence_of(*params)
		params.each do |param|
			raise ArgumentError, PRESENCE_REQUESTED if param.nil?
		end
	end


	def _validate_presence_of_hash(hash)
		hash.each_pair do |key, value|
			_validate_presence_of value
		end

	end

end
