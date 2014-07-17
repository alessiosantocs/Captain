class PaperworkMailer < ActionMailer::Base
	default from: "Captain Team <captain_app@gmail.it>"

	def deploy_notification(deploy)
		@deploy 				= deploy
		
		mail_options 			= {}
		user 					= deploy.deployable_application.user

		from_mail				= user.configurations[:paperwork_from_mail].try(:value)

		mail_options[:to]		= user.configurations[:paperwork_to_mails].value.split(",")
		mail_options[:subject]	= user.configurations[:paperwork_subject] || 'È stato effettuato un nuovo deploy'
		mail_options[:from]		= from_mail if from_mail.present?
		
		mail(mail_options)
	end

end