class IdeasController < ApplicationController
  def index
  end

  def show
    if session[:user] != nil
      @active_user=session[:user]
    else
      @active_user=nil
    end


  	id=params[:id]
  	@idea=Idea.find(id)
    @user=User.find_by_id(@idea.user_id)
  end

  def create
  	@idea=Idea.create!(params[:idea])
  	redirect_to idea_path(@idea.id)
  end

  def edit
    if session[:user] != nil
      @active_user=session[:user]
    else
      @active_user=nil
    end
    id=params[:id]
    @idea=Idea.find(id)
    @user=User.find_by_id(@idea.user_id)
  end

  def update
    @idea=Idea.find(params[:id])
    @idea.update_attributes!(params[:idea])
    redirect_to idea_path(@idea.id)
  end

  
end
