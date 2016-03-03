class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.where(ownername: params[:ownername]).first
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to @user
  	else
  		flash[:notice] = "Sign-in Failed!"
  		redirect_to login_path
  	end
  end

  def destroy
  	session.destroy
  	flash[:notice] = "Logout Successful!"
  	redirect_to '/'
  end
end
