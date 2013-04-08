class UsersController < ApplicationController
  # def index

  # end

  def create
 		if @user = User.create(params[:user])
      redirect_to(@user, :notice => 'User was successfully created.')
    else
      flash[:warning] = "Please try again"
      redirect_to home_index_path
    end
  end

  def show
    @user=User.find(params[:id])#gets user from database - rg
  end
  
end
