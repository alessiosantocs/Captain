class PullRequest < ActiveRecord::Base
	# Each deploy is composed of pull requests
	belongs_to :deployment
end
