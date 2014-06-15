class PullRequestsController < BaseController
	# must be logged in
	before_filter :scm_associate_user!

	before_action :set_pull_request, only: [:show, :edit, :update, :destroy]


	# GET /pull_requests
	# GET /pull_requests.json
	def index

		app_id = params[:deployment_id]

		if deployment_id = app_id
			@deployment = Deployment.find_by_id(deployment_id)
			@pull_requests = @deployment.pull_requests.all
		else
			@pull_requests = Deployment.all
		end

	end

	# GET /pull_requests/1
	# GET /pull_requests/1.json
	def show
		@pull_request.additional_info
		respond_to do |format|
			format.html {  }
			format.json { render json: @deployment }
		end

	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_pull_request
			if deployment_id = params[:deployment_id]
				@deployment = Deployment.find_by_id(deployment_id)
				@pull_request = @deployment.pull_requests.find(params[:id])
			else
				@pull_request = PullRequest.find(params[:id])
			end
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def deployment_params
			params.require(:deployment).permit(:version)
		end

end
