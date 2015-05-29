class AuthenticationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:notice] = "Welcome to Thunderdome!"
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
    flash[:notice] = "Signed out!"
  end


end
