class IdeasController < ApplicationController
  def index
  end

  def show
  	id=params[:id]
  	@idea=Idea.find(id)
  end

  def create
  	@idea=Idea.create!(params[:idea])
  	redirect_to idea_path(@idea.id)
  end
  
end
