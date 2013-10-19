# Renee
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user
  before_filter :check_login
  skip_before_filter :check_login, :only => [:create_session]

  def create_session
  	#gets params and finds user with such a username and password, then sets user to session -rg
  	user = User.find_by_username(params[:user][:username_login])
  	if user && user.password == params[:user][:password_login] && session[:user_id] = user.id
  		set_current_user#sets sets @current_user if user was found -rg
  	else
      if user == nil
        flash[:warning] = "There is no such username.  Please try again."
      else
  		  flash[:warning] = "That password did not match the username.  Please try again."#setting falsh warning if no such user exists -rg
  	 end
    end
  	redirect_to root_path#and to the home page! -rg
  end

  def set_current_user
  	@current_user ||= session[:user_id]#sets @current_user to valid session user if nil -rg
  end


  def logout_user
    get_current_user.update_attributes(:last_login => Time.now)
  	reset_session#resets session -rg
  	@current_user = nil
  	redirect_to root_path
  end

  def get_current_user
  	User.find_by_id(@current_user)
  end

  def get_messages
    get_current_user.received.order('created_at DESC')
  end

  def get_updated
    user = get_current_user
    @updated = []
    # ideas that have been updated
    @updated += user.collaborated_ideas.where("updated_at >= :date", date: user.last_login).all
    # comments that have been  created
    user.collaborated_ideas.each do |idea|
      @updated += idea.comments.where("created_at >= :date", date: user.last_login).all
    end
    user.ideas.each do |idea|
      @updated += idea.comments.where("created_at >= :date", date: user.last_login).all
    end
    return @updated
  end

  def check_login
    unless get_current_user
      flash[:warning] = "You need to be logged in to do that"
      redirect_to root_path
    end
  end
end

