module ValidatorHelper

	PRESENCE_REQUESTED 	= "parameter cannot be nil"
	RECORD_REQUESTED 	= "Active record cannot be nil"

	# Ensures that essential arguments are present before request is made
	#
	def _validate_presence_of(*params)
		params.each do |param|
			raise ArgumentError, PRESENCE_REQUESTED if param.nil?
		end
	end

	# Ensures that essential arguments are present before request is made
	#
	def _validate_presence_of_record(record)
		raise ActiveRecord::RecordNotFound, PRESENCE_REQUESTED if record.nil?
	end


	# Ensures that all the elements in the hash are not nil
	def _validate_presence_of_hash(hash)
		hash.each_pair do |key, value|
			_validate_presence_of value
		end

	end

end
