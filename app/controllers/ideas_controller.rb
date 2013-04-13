class IdeasController < ApplicationController
  # skip_before_filter :set_current_user
  def index
    @idea=Idea.all

    respond_to do |format|
      format.html
      format.json { render json: @idea}
    end
  end
  
  # skip_before_filter :set_current_user
  def show
  	@idea=Idea.find(params[:id])
    @user=User.find_by_id(@idea.user_id)
  end

  # skip_before_filter :set_current_user
  def create
    #raise params.inspect
    params[:idea][:user_id]=params[:user_id]
  	@idea=Idea.create!(params[:idea])
  	redirect_to edit_idea_path(@idea.id)
  end

  # skip_before_filter :set_current_user
  def edit
    @idea=Idea.find(params[:id])
    @user=User.find_by_id(@idea.user_id)
  end

  # skip_before_filter :set_current_user
  def update
    @idea=Idea.find(params[:id])
    @idea.update_attributes!(params[:idea])
    redirect_to idea_path(@idea.id)
  end

  
end
