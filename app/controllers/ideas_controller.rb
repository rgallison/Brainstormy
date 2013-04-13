class IdeasController < ApplicationController
  def index
    @idea=Idea.all

    respond_to do |format|
      format.html
      format.json { render json: @idea}
    end
  end
  
  def show
  	@idea=Idea.find(params[:id])
    @user=User.find_by_id(@idea.user_id)
  end

  def create
    #raise params.inspect
    params[:idea][:user_id]=params[:user_id]
  	@idea=Idea.create!(params[:idea])
  	redirect_to edit_idea_path(@idea.id)
  end

  def edit
    @idea=Idea.find(params[:id])
    @user=User.find_by_id(@idea.user_id)
  end

  def update
    @idea=Idea.find(params[:id])
    @idea.update_attributes!(params[:idea])
    redirect_to idea_path(@idea.id)
  end

  
end
