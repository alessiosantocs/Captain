#DeploydApp
A hassle-free deployment tracking system that will never forget one.

##Development guidelines
TODO...

##What it does right now
It tracks deployments of web applications written in **Ruby on Rails** and deployed with **Capistrano** using **Bitbucket** as repo-management-system.

##How does it work?
First, you install the gem provided at [https://github.com/alessiosantocs/deployd](https://github.com/alessiosantocs/deployd) like this in your gemfile:
    
    gem 'deployd', :git => 'https://github.com/alessiosantocs/deployd'

Then you just call the rake task (TODO completely):

    rake deployd:install PUBLIC_TOKEN=<YOUR_PUBLIC_TOKEN_HERE> APP_NAME=<YOUR_APP_NAME_HERE>

It should create for you the config/initializers/deployd.rb file with credentials and insert a few lines of code into your config/deploy.rb file.

Once done, you can **cap whatever deploy** your application and DeploydApp will do the rest.

The rest is:

- Injecting code into your capistrano deploy procedure
- Invoke a rake to notify the system of your deployment (passing some important stuff such as the deployed branch, the current revision, the environment)
- The system will start a rake to fetch all new merged pull requests from bitbucket

Then you shall go to your backend and have the list of your desires.
