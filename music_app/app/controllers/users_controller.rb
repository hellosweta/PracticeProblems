class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render :show
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

  def new
    @user = User.new(user_params)
    render :new 
  end

  def user_params
    params.require(:user).permit(:email, :password_digest, :session_token)
  end
end
