class UserMailer < ApplicationMailer
	# default from: 'flatironpicpickr@gmail.com'

	def result_email(user)
		@user = user
		@url  = user.photo_url
		binding.pry
    mail(to: @user.email_address, subject: 'Your favorite photo')
	end


end
