class IdeasController < ApplicationController
  def index
  end

  def show
  	id=params[:id]
  	@idea=Idea.find(id)
    @user=User.find_by_id(@idea.user_id)
  end

  def create
  	@idea=Idea.create!(params[:idea])
  	redirect_to idea_path(@idea.id)
  end
  
end
