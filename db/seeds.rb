# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create the main user
User.create!(:email => "alessio.santo@pazienti.it", :password => "pazienti")

# Create a default application for this user
DeployableApplication.create!(:name => "Pazienti.it", 
							  :user => User.first, 
							  :repo => "https://piazz32@bitbucket.org/pazientidevs/pazienti2.git")


# Your first deployment
Deployment.create!(:branch 		=> "master",
				   :environment => "production",
				   :revision 	=> "3e4fa1e3a5721e19d1829437ed7e4bc00d8f81ce",
				   :repo 		=> "https://piazz32@bitbucket.org/pazientidevs/pazienti2.git",
				   :deployable_application => DeployableApplication.first)