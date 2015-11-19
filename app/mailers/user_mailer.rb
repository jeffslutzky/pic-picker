class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def result_email(user)
		binding.pry
		@user = user
		@url  = "@picture_chosen.photo_url"
		# need to pass along the url; user has_many favorites?
    mail(to: @user.email_address, subject: 'Your favorite photo')
	end


end
