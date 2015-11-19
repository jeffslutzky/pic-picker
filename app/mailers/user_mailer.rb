class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def result_email(user)
		binding.pry
		@user = user
		@url  = user.photo_url
    mail(to: @user.email_address, subject: 'Your favorite photo')
	end


end
