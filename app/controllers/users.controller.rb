class UsersController < ApplicationController
  def index

  end

  def new
  	user_info = :params[:user]
  	if user_info[:password] == user_info[:password2] and user_info[:email] == user_info[:email2]
  		user_info.delete("password2")
  		user_info.delete("email2")
  		@user = User.create!(user_info)
  		flash[:notice] = "#{@user.username} has been added.  Please fill out your profile page."
  		redirect_to user_path
  	else
  		flas[:notice] = "Please try again."
  		redirect_to root_path
  	end
  end

  def show

  end
  
end
