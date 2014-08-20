class Ability

	include CanCan::Ability
	
	def initialize(user, params)
		# Define abilities for the passed in user here. For example:

		if user.present?
			can :read, :all
			can :update, :all
			can :create, :all
			can :destroy, :all
		else
		# If not logged in
			# Check if the user passed a token in
			if DeployableApplication.find_by_public_token(params[:public_token]).present?
				can :read, :deployable_applications
				can :read, :deployments
			end
		end

		# user ||= User.new # guest user (not logged in)
		# The first argument to `can` is the action you are giving the user 
		# permission to do.
		# If you pass :manage it will apply to every action. Other common actions
		# here are :read, :create, :update and :destroy.
		#
		# The second argument is the resource the user can perform the action on. 
		# If you pass :all it will apply to every resource. Otherwise pass a Ruby
		# class of the resource.
		#
		# The third argument is an optional hash of conditions to further filter the
		# objects.
		# For example, here the user can only update published articles.
		#
		#   can :update, Article, :published => true
		#
		# See the wiki for details:
		# https://github.com/ryanb/cancan/wiki/Defining-Abilities
	end
end
