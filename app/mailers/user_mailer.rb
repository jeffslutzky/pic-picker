class UserMailer < ApplicationMailer
	default from: 'jeffslutzky@gmail.com'

	def result_email(user)
		@user = user
		@url  = user.photo_url
    mail(to: @user.email_address, subject: 'Your favorite photo')
	end


end
