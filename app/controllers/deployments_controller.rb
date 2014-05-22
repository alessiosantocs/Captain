class DeploymentsController < ApplicationController
	# must be logged in
	before_filter :authenticate_user!

	before_action :set_deployment, only: [:show, :edit, :update, :destroy]


	# GET /deployments
	# GET /deployments.json
	def index
		@deployments = current_user.deployments.all
	end

	# GET /deployments/1
	# GET /deployments/1.json
	def show

		uid = current_user.authentications.first.uid
		token = current_user.authentications.first.access_token
		secret = current_user.authentications.first.token_secret
		consumerkey = current_user.authentications.first.consumer_key
		consumersecret = current_user.authentications.first.consumer_secret
		
		bitbucket = BitBucket.new do |config|
			config.oauth_token = token
			config.oauth_secret = secret

			config.client_id = consumerkey
			config.client_secret = consumersecret
		end

		raise
		@issues = bitbucket.issues.list_repo(@deployment.repo_owner, @deployment.repo_name, {status: "resolved"})

	end

	# GET /deployments/new
	# def new
	# 	@deployment = Deployment.new
	# end

	# GET /deployments/1/edit
	def edit
	end

	# POST /deployments
	# POST /deployments.json
	# def create
	# 	@deployment = Deployment.new(deployment_params)

	# 	respond_to do |format|
	# 		if @deployment.save
	# 			format.html { redirect_to @deployment, notice: 'Deployment was successfully created.' }
	# 			format.json { render action: 'show', status: :created, location: @deployment }
	# 		else
	# 			format.html { render action: 'new' }
	# 			format.json { render json: @deployment.errors, status: :unprocessable_entity }
	# 		end
	# 	end
	# end

	# PATCH/PUT /deployments/1
	# PATCH/PUT /deployments/1.json
	def update
		respond_to do |format|
			if @deployment.update(deployment_params)
				format.html { redirect_to @deployment, notice: 'Deployment was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @deployment.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /deployments/1
	# DELETE /deployments/1.json
	def destroy
		@deployment.destroy
		respond_to do |format|
			format.html { redirect_to deployments_url }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_deployment
			@deployment = current_user.deployments.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def deployment_params
			params.require(:deployment).permit(:version)
		end
end
