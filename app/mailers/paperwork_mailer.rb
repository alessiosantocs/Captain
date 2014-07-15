class PaperworkMailer < ActionMailer::Base
	default from: "Captain Team <captain_app@gmail.it>"

	def deploy_notification(deploy)
		@deploy 				= deploy
		
		mail_options 			= {}
		user 					= deploy.user

		mail_options[:from]		= user.configurations[:paperwork_from_mail]
		mail_options[:to]		= user.configurations[:paperwork_to_mails].split(",")
		mail_options[:subject]	= user.configurations[:paperwork_subject] || 'È stato effettuato un nuovo deploy'
		
		mail(mail_options)
	end

end