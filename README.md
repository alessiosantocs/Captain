#Captain
This is the official documentation for Captain ((https://alessiosantocs.github.io/captain)[https://alessiosantocs.github.io/captain])

##What is it?
Captain is a deployment tracking system. It tracks deployments of web applications by simply integrating into your app's deployment process.

Captain's purpose is to integrate and lead to success every deploy of every kind of web app!

Unfortunately, right now, _Captain is under development_ and it may be not be available for some infrastructure yet. See the [development status](#captain-status) to check if we support your system or help us **build an integration** (coming soon!).


##Development status
We are currently on _Alpha stage_.

Supported infrastructures:

- Application type: **Ruby on Rails** - Scm service: **BitBucket** - Deployed with: **Capistrano**

For any other configuration, we'd be more than happy to listen what you have to say about Captain and have a look at your app's environment to better understand what integration might be built around that.

##Getting started
Using Captain should be very straight forward. 
Let's have a look at how it integrates in different systems; but before that, create an account at [http://deploydapp.herokuapp.com](http://deploydapp.herokuapp.com) (or at your self-hosted application's url):

1. Authenticate with your SCM
2. Create an application
3. Get your public key from the instruction popup.

###Installing on Rails + Bitbucket + Capistrano
Few steps for a great integration. Install the _captain-rails_ gem for in your gemfile like this:
    
    gem 'captain-rails', :git => 'https://github.com/alessiosantocs/captain-rails' # Then bundle install

Then a rake must be called:

    rake captain:install[<Your public token>]

It should do everything by itself.

Once done, you can **cap whatever deploy** your application and Captain will do the rest.
You'll start noticing deployments coming on your dashboard.

##Open source Vs. Hosted service
We love open source and we think the time is right to start a project like this and involve the entire community to come and contribute.

This open source approach will allow developers and application owners also to build a self hosted version of Captain on their own servers.

Right now, we're hosting a centralized solution to deliver the most effortless experience to  users.

Feel free to fork and contribute to the gem using the guideline (we're working on it). You can also report bugs in the issue tracker and so forth.
