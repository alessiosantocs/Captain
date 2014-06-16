class Api::V1::DeployableApplicationsController < Api::V1::BaseController

	before_action :set_deployable_application, only: [:show, :edit, :update, :destroy]

	# PUT /deployable_applications/token/activate
	def activate

		@deployable_application = DeployableApplication.find_by_public_token(params[:deployable_application_id])

		_validate_presence_of_record @deployable_application

		@deployable_application.installed = true

		if @deployable_application.save
			render :json => "Done", status: :ok
		else
			render :json => "Errors"
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_deployable_application
			@deployable_application = DeployableApplication.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def deployable_application_params
			params.require(:deployment).permit(:installed)
		end

end
