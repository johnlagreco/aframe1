class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to login_path
  	else
  		redirect_to :back
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	@user.save
  	redirect_to user_path(@user)
  	flash[:notice] = "Your Account Has Been Updated!"
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.delete
  	redirect_to '/'
  	flash[:notice] = "Your Account Has Been Deleted!"
  end
  
  private
  def user_params
  	params.require(:user).permit(:coname, :ownername, :address, :city, :state, :zip, :password)
  end
end
