class IdeasController < ApplicationController
  def index
    @ideas_created = User.find_by_id(@current_user).ideas#gets all the ideas user created -rg 4/15
    @ideas_commented = User.find_by_id(@current_user).commented_ideas#gets all ideas that the user commented on -rg 4/15
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
    if params[:collaborator] != nil
      @idea.collaborators<< User.find_by_username(params[:collaborator])
      #redirect_to edit_idea_path(@idea.id)
      redir=edit_idea_path(@idea.id)
    else
      @idea.update_attributes!(params[:idea])
      redir=idea_path(@idea.id)
    end
    redirect_to redir
  end

  
end
