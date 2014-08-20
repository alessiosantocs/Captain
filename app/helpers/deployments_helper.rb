module DeploymentsHelper

	def deployment_title(deployment)
		title_regex(deployment.title, deployment.deployable_application.name).html_safe
	end

	def deployment_subtitle(deployment)
		description = deployment.description

		description = description.gsub("\n", "<br>")

		description.html_safe
	end

	def formatted_time(date)
		date.strftime "%d %b %Y %H:%M"
	end

	private 

	def title_regex(title, suffix="")
		regex = /(v([\d]\.?)+)/
		
		title.gsub(regex) {|v| "<small class='text-info'>#{v} #{suffix}</small>"}
	end
end
