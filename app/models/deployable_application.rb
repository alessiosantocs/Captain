class DeployableApplication < ActiveRecord::Base

	# It belongs to one and only one User
	belongs_to :user
	
	# Every deploy the user has made
	has_many :deployments
	# Every pull request associated to the user
	has_many :pull_requests


end
