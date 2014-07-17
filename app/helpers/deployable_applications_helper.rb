module DeployableApplicationsHelper
	def possible_repos(c_user)

		user = c_user.authentications.first.uid

		c_user.scm_client.repos.list.map { |repo| ["#{repo.name}.git", "https://#{user}@bitbucket.org/#{repo.owner}/#{repo.name}.git"] }
	end
end
