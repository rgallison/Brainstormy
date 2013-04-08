class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user

  def create_session
  	session[:user] = User.where(:username => params[:user][:username_login], :password => params[:user][:password_login])
  	set_current_user
  	redirect_to root_path
  end

  def set_current_user
  	@current_user ||= session[:user]
  end

  def logout_user
  	reset_session
  	@current_user = nil
  	redirect_to root_path
  end
end
