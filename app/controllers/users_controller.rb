class UsersController < ApplicationController

def create
    @user = User.new(user_params)
    respond_to do |format|
    	@user.email_address = params[:user][:email_address]
      @user.photo_url = params[:photo_url]
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.result_email(@user).deliver_now
        # binding.pry
        format.html { redirect_to(root_path, notice: 'Favorite photo chosen') }
        format.json { render json: root_path, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


private

def user_params
	params.require(:user).permit(user: [:email_address, :photo_url] )
end

end
