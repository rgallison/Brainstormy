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
    #4/18 Colin added check for adding collaborators:
    if params[:collaborator] != nil
      user=User.find_by_username(params[:collaborator])
      if user != nil
        if not @idea.collaborators.include? user
          @idea.collaborators<< user
          flash[:notice] ="User #{params[:collaborator]} added to Collaborators."
        else
          flash[:notice] ="User #{params[:collaborator]} already added to Collaborators."
        end
      else
        flash[:notice] ="User #{params[:collaborator]} does not exist."
      end
      redir=edit_idea_path(@idea.id)
    else
      @idea.update_attributes!(params[:idea])
      redir=idea_path(@idea.id)
    end
    redirect_to redir
  end

  
end
