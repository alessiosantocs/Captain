module DeployableApplicationsHelper
	def possible_repos

		user = current_user.authentications.first.uid

		current_user.scm_client.repos.list.map { |repo| "https://#{user}@bitbucket.org/#{repo.owner}/#{repo.name}.git" }
	end
end
