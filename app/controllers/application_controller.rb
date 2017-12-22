class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,:logged_in?,:require_user #these methods can be accessed from anywhere in views or other controllers

  def current_user
  @current_user||= User.find_by(id:session[:user_id]) if session[:user_id]
    #if sessions user_id exists then it find that users object from user database by its id and returns the object
  end

  def logged_in?

     !!@current_user  #if user is logged in it returns true to user else it returns false

  end

  def require_user
    if !logged_in?
      flash[:danger]="User must logged in do perform certain actions on the page"
      redirect_to root_path
    end
  end

end
