class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user

  def create_session
  	#gets params and finds user with such a username and password, then sets user to session -rg
  	if session[:user] = User.where(:username => params[:user][:username_login], :password => params[:user][:password_login])
  		set_current_user#sets sets @current_user if user was found -rg
  	else
  		flash[:warning] = "That is not a valid login.  Please try again."#setting falsh warning if no such user exists -rg
  	end
  	redirect_to root_path#and to the home page! -rg
  end

  def set_current_user
  	@current_user ||= session[:user]#sets @current_user to valid session user if nil
  end

  def logout_user
  	reset_session#resets session -rg
  	@current_user = nil
  	redirect_to root_path
  end
end
