class UsersController < ApplicationController

  def create
 		if @user = User.create(params[:user])#gets params, tries to add to user database, and checks if successful -rg
      flash[:notice] = 'User was successfully created.'#redirects to profile page with successful flash
      create_session
      redirect_to(@user.id)
    else
      flash[:warning] = "Please try again"#sets warning flash for failed add -rg
      redirect_to root_path#redirects to home page -rg
    end
  end

  def show
    @user ||=User.find(params[:id])#gets user from database - rg
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
    redirect_to user_path(@user)
  end

  
end
