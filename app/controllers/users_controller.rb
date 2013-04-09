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
    if params.present? # - if there are params now, we don't need form anymore
      @showform = 'hide'
      @showlist = 'show'
    end
    if !params.present?
      @showform = 'show'
      @showlist = 'hide'
    end
  end

#Rachel - updates attributes of user from params[]
  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "#{@user.name} was successfully updated."
    redirect_to user_path
  end

  
end
