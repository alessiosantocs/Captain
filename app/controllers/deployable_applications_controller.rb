class DeployableApplicationsController < ApplicationController

	before_action :authenticate_user!, :scm_associate_user!

	before_action :force_single_application_management, only: [:index, :edit, :new, :show]

	before_action :set_deployable_application, only: [:show, :edit, :update, :destroy]

	# GET /deployable_applications
	# GET /deployable_applications.json
	def index
		# @deployable_applications = DeployableApplication.all
	end

	# GET /deployable_applications/1
	# GET /deployable_applications/1.json
	def show
	end

	# GET /deployable_applications/new
	def new
		@deployable_application = DeployableApplication.new
	end

	# GET /deployable_applications/1/edit
	def edit
	end

	# POST /deployable_applications
	# POST /deployable_applications.json
	def create
		@deployable_application = current_user.deployable_applications.new(deployable_application_params)

		respond_to do |format|
			if @deployable_application.save
				format.html { redirect_to @deployable_application, notice: 'DeployableApplication was successfully created.' }
				format.json { render action: 'show', status: :created, location: @deployable_application }
			else
				format.html { render action: 'new' }
				format.json { render json: @deployable_application.errors, status: :unprocessable_entity }
			end
		end
	end


	private
		# Use callbacks to share common setup or constraints between actions.
		def set_deployable_application
			@deployable_application = current_user.deployable_applications.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def deployable_application_params
			params.require(:deployable_application).permit(:repo, :branch, :name)
		end

		def force_single_application_management
			# Does the user have any application
			if current_user.deployable_applications.any?
				# if yes redirect to the first application of the user
				redirect_to deployable_application_url current_user.deployable_applications.first if params[:action] != 'show'
			else
				# if no make him create a new one
				redirect_to new_deployable_application_url if params[:action] != 'new'
			end
		end
end
