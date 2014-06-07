module ValidatorHelper

	PRESENCE_REQUESTED = "parameter cannot be nil"

	# Ensures that essential arguments are present before request is made
	#
	def _validate_presence_of(*params)
		params.each do |param|
			raise ArgumentError, PRESENCE_REQUESTED if param.nil?
		end
	end


	# Ensures that all the elements in the hash are not nil
	def _validate_presence_of_hash(hash)
		hash.each_pair do |key, value|
			_validate_presence_of value
		end

	end

	# Check if the user has an scm association
	def scm_associate_user!
		if current_user.present?
			if current_user.authentications.empty?
				redirect_to authentications_url, :status => :bad_request
			end
		end
	end

end
