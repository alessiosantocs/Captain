class PullRequest < ActiveRecord::Base
	# Any application should have pull requests
	belongs_to :deployable_application
end
