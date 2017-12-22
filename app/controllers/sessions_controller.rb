class SessionsController < ApplicationController

  #########################LOG IN ##############################
  def new

  end

  def create
    user = User.find_by(email:params[:session][:email].downcase) #find the user with email id and returns an object to acess it
    if user && user.authenticate(params[:session][:password])
      flash[:success]= "User logged in successfully "
      session[:user_id] = user.id #session's user_id by default nil
      redirect_to root_path
    else
      flash[:danger]= "Something is wrong check your username and password again"
      render 'new'
    end
  end
  ############################ LOG OUT ##########################
  def destroy
    session[:user_id]=nil
    flash[:notice]="You logged out successfully"
    redirect_to root_path
  end

end