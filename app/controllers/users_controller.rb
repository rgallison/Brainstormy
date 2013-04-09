class UsersController < ApplicationController

  def create
 		if @user = User.create!(params[:user])#gets params, tries to add to user database, and checks if successful -rg
      session[:user_id] = @user.id if @user
      set_current_user#sets sets @current_user if user was found -rg
      flash[:notice] = "You have successfully been added.  Please fill out your profile."
      redirect_to user_path(@user.id)#redirects to home page -rg      
    else
      flash[:warning] = "There is an invalid entry.  Please try again"#sets warning flash for failed add -rg
      redirect_to root_path
    end
  end

  def show
    flash[:notice] = params[:id].inspect.to_s
    @user ||=User.find(params[:id])#gets user from database - rg
    if !params[:flag] # - if there are params now, we don't need form anymore
      @showform = 'hide'
      @showlist = 'show'
      @flag = false;
    else
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
