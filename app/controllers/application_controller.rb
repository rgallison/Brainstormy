class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user

  def create_session
  	#gets params and finds user with such a username and password, then sets user to session -rg
  	user = User.find_by_username(params[:user][:username_login])
  	if (session[:user_id] = user.id if user)
  		set_current_user#sets sets @current_user if user was found -rg
  	else
  		flash[:warning] = "That is not a valid login.  Please try again."#setting falsh warning if no such user exists -rg
  	end
  	redirect_to root_path#and to the home page! -rg
  end

  def set_current_user
  	@current_user ||= session[:user_id]#sets @current_user to valid session user if nil -rg
  end

  def logout_user
  	reset_session#resets session -rg
  	@current_user = nil
  	redirect_to root_path
  end

  def get_current_user
  	User.find_by_id(session[:user_id])
  end
end
