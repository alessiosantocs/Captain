class Api::V1::DeploymentsController < Api::V1::BaseController

	before_action :set_deployment, only: [:show, :edit, :update, :destroy]

	# POST /deployments
	# POST /deployments.json
	def create
		@app 				= find_deployable_application_by("public_token", params[:deployment][:deployable_application_id])

		@deployment 		= Deployment.new(deployment_params)
		# @deployment.user 	= User.first

		if @deployment.save
			render :json => "Done"
		else
			render :json => "Errors"
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_deployment
			@deployment = Deployment.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def deployment_params
			params.require(:deployment).permit(:branch, :environment, :revision, :repo)
		end

end
