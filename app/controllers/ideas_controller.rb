class IdeasController < ApplicationController
  def index
    @ideas_created = User.find_by_id(@current_user).ideas#gets all the ideas user created -rg 4/15
    @ideas_commented = User.find_by_id(@current_user).commented_ideas#gets all ideas that the user commented on -rg 4/15
  end
  
  def show
  	@idea=Idea.find(params[:id])
    @user=User.find_by_id(@idea.user_id)
    @comments = Comment.where("idea_id = ?", params[:id])
    @tags=@idea.tags
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
    #5/2 Colin added check for subscribers
    if params[:collaborator] != nil or params[:subscriber] != nil
      if params[:collaborator] != nil
        user=User.find_by_username(params[:collaborator])
        redir=edit_idea_path(@idea.id)
        flashtext="Collaborators"
      else
        user=User.find_by_id(params[:subscriber])
        redir=idea_path(@idea.id)
        flashtext="Subscribers"
      end
      if user != nil
        if not @idea.collaborators.include? user
          @idea.collaborators<< user
          flash[:notice] ="User #{user.username} added to #{flashtext}."
        else
          flash[:notice] ="User #{user.username} already added to #{flashtext}."
        end
      else
        flash[:notice] ="User #{params[:collaborator]} does not exist."
      end
      #redir=edit_idea_path(@idea.id)


    #5/2 Colin added tags:
    elsif params[:tag] != nil
      tag=Tag.find_by_category(params[:tag])
      if tag == nil
        tag = Tag.create!(:category => params[:tag])
      end
      @idea.tags<< tag
      redir=edit_idea_path(@idea.id)
    else
      if params[:privacy]=='1'
        params[:idea][:privacy]='private'
      else
        params[:idea][:privacy]='public'
      end
      @idea.update_attributes!(params[:idea])
      redir=idea_path(@idea.id)
    end
    redirect_to redir
  end

  
end
