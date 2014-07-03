#Captain
This is the official documentation for Captain.

##What is it?
Captain is a deployment tracking system. It tracks deployments of web applications by simply integrating into your app's deployment process.

Captain's purpose is to integrate and lead to success every deploy of every kind of web app!

Unfortunately, right now, _Captain is under development_ and it may be not be available for some infrastructure yet. See the [development status](#captain-status) to check if we support your system or help us **build an integration** (coming soon!).


##Development status
We are currently on _Alpha stage_.

Supported infrastructures:

- Application type: **Ruby on Rails** - Scm service: **BitBucket** - Deployed with: **Capistrano**

For any other configuration, we'd be more than happy to listen what you have to say about Captain and have a look at your app's environment to better understand what integration might be built around that.

##Basic usage
Using Captain should be very straight forward. 
    
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

##Open source Vs. Hosted service
We love open source and we think the time is right to start a project like this and involve the entire community to come and contribute.

This open source approach will allow developers and application owners also to build a self hosted version of Captain on their own servers.

Right now, we're hosting a centralized solution to deliver the most effortless experience to  users.

Feel free to fork and contribute to the gem using the guideline (we're working on it). You can also report bugs in the issue tracker and so forth.
