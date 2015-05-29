class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:user_name, :email, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_challenge_path, notice: "Thanks for signing up!"
    else
      render :new
    end
  end


end
