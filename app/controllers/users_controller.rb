# Collaborated: Renee, Rachel
class UsersController < ApplicationController
  skip_before_filter :check_login, :only => [:create]
  def create
    @user = User.new(params[:user])#gets params and creates a new db item
 		if @user.save #checks if save to db is successful -rg
      session[:user_id] = @user.id if @user#assigns id to session when accound it created
      set_current_user#sets sets @current_user if user was found -rg
      flash[:notice] = "You have successfully been added.  Please fill out your profile."
      redirect_to user_path(@user.id)#redirects to home page -rg      

    else
      flash[:warning] = "That is an invalid entry.  Please try again: "#sets warning flash for failed add -rg
      if @user.errors.any?
        @user.errors.full_messages.each do |message|
          flash[:warning] += message + ". "
        end
      end
      redirect_to root_path
    end
  end

  def edit
    
  end

  def show
    @user ||=User.find(params[:id])#gets user from database - rg
    if !params[:flag] # - if there are params now, we don't need form anymore
      @showform = 'hide'
      @showlist = 'show'
    else
      @showform = 'show'
      @showlist = 'hide'
    end
    @ideas_created = @user.ideas.order('created_at DESC')
    @ideas_collaborated = @user.commented_ideas.order('created_at DESC').uniq
  end

#Rachel - updates attributes of user from params[]
  def update
    @flag = false#set flag to false.  No longer need edit form. -rg
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    redirect_to user_path(@user), notice: "#{@user.name} was successfully updated."
  end

end
