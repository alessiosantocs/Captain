class Api::V1::DeploymentsController < Api::V1::BaseController

	include ExceptionsHelper

	# before_action :set_deployment, only: [:show, :edit, :update, :destroy]

	# POST /deployments
	# POST /deployments.json
	def create
		@app 				= find_deployable_application_by("public_token", params[:deployment][:deployable_application_id])

		# Chech if the branch and the environment are correct, otherwise kill the request with raise HTTPUnauthorized
		validate_branch_and_environment(@app, params)


		# CREATE NEW RAKE DEPLOY
		@deployment 		= @app.deployments.create!(deployment_params)

		RakeInvoker.run(pull_requests: :fetch_for_app, PUBLIC_TOKEN: @app.public_token, APP_ID: @app.id, DEPLOYMENT_ID: @deployment.id)

		# @deployment.user 	= User.first

		if @deployment.save
			render :json => "Done"
		else
			render :json => "Errors"
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		# def set_deployment
		#	@deployment = Deployment.find(params[:id])
		# end

		# Never trust parameters from the scary internet, only allow the white list through.
		def deployment_params
			params.require(:deployment).permit(:branch, :environment, :revision, :repo, :author_name, :author_email)
		end

		# Check if deploy branch are equals to settings
		def validate_branch_and_environment(app, params)
			unless @app.branch == params[:deployment][:branch] && @app.environment == params[:deployment][:environment]
				raise HTTPUnauthorized
			end
		end

end
