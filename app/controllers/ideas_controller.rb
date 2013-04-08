class IdeasController < ApplicationController
  def index
  end

  def show
    @active_user=session[:user]
  	@idea=Idea.find(params[:id])
    @user=User.find_by_id(@idea.user_id)
  end

  def create
  	@idea=Idea.create!(params[:idea])
  	redirect_to idea_path(@idea.id)
  end

  def edit
    @active_user=session[:user]
    @idea=Idea.find(params[:id])
    @user=User.find_by_id(@idea.user_id)
  end

  def update
    @idea=Idea.find(params[:id])
    @idea.update_attributes!(params[:idea])
    redirect_to idea_path(@idea.id)
  end

  
end
