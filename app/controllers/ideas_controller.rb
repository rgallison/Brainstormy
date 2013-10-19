# Collaborated: Colin, Renee

class IdeasController < ApplicationController
  skip_before_filter :check_login, :only => [:show]

  def index
    @ideas_created = get_current_user.ideas#gets all the ideas user created -rg 4/15
    @comments = get_current_user.comments#gets all ideas that the user commented on -rg 4/15
    @updated = get_updated
    @user = get_current_user
  end
  
  def show
  	@idea=Idea.find(params[:id])
    @user=User.find_by_id(@idea.user_id)
    @comments = @idea.comments
    @tags=@idea.tags
  end

  def create
    #raise params.inspect
    params[:idea][:user_id]=params[:user_id]
  	@idea=Idea.new(params[:idea])
    if @idea.save
  	  redirect_to edit_idea_path(@idea.id)
    else
      flash[:warning] = "That is an invalid entry.  Please try again: "#sets warning flash for failed add -rg
      if @idea.errors.any?
        # raise @user.errors.full_messages.inspect
        @idea.errors.full_messages.each do |message|
          flash[:warning] += message + ". "
        end
        redirect_to root_path
      end
    end
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
      #retrieves the user profile for collaborator from db
      if params[:collaborator] != nil
        user=User.find_by_username(params[:collaborator])
        redir=edit_idea_path(@idea.id)
        flashtext="Collaborators"
      #retrieves the user profile for subscriber from db
      else
        user=User.find_by_id(params[:subscriber])
        redir=idea_path(@idea.id)
        flashtext="Subscribers"
      end
      #handles the addition of user
      if user != nil
        if @idea.collaborators.include? user
          flash[:notice] ="User #{user.username} already added to #{flashtext}."
        else
          @idea.collaborators<<user
          #Colin added message on 5/2:
          message=Message.create!(:subject => "You have been added to #{@idea.title}", :body => "You are now subscribed to this idea and are welcome to contribute your thoughts!", :status => 'unread', :sender => @idea.user_id)
          message.received<< user
          flash[:notice] ="User #{user.username} added to #{flashtext}."       
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
    elsif params[:delete_tag] != nil
      tag=Tag.find_by_id(params[:delete_tag])
      @idea.tags.delete(tag)
      redir=edit_idea_path(@idea.id)
      flash[:notice]="#{tag.category} deleted from tags."
    elsif params[:delete_collaborator] != nil
      collab=User.find_by_id(params[:delete_collaborator])
      @idea.collaborators.delete(collab)
      redir=edit_idea_path(@idea.id)     
      flash[:notice]="#{collab.name} deleted from subscribers."
    else
      if params[:privacy]=='1'
        is_private = true
      else
        is_private = false
      end
      #Colin added validation 6/27/13
      updated_idea=Idea.new(params[:idea]) #attempts to create an idea with the updated info
      if updated_idea.valid? #check that user did not invalidate idea with update
        @idea.update_attributes!(params[:idea])
        redir=idea_path(@idea.id)
      else
        redir=edit_idea_path(@idea.id)   
        flash[:warning] = "That is an invalid entry.  Please try again: "#sets warning flash for failed add -rg
        if updated_idea.errors.any?
          # raise @user.errors.full_messages.inspect
          updated_idea.errors.full_messages.each do |message|
            flash[:warning] += message + ". "
          end
        end
      end        
    end
    redirect_to redir
  end

  #Colin added 5/3:
  def destroy
    Idea.find(params[:id]).destroy
    redirect_to root_path
  end


  
end
