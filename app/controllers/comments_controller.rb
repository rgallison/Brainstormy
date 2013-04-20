#Lindsey Stratton
#April 19 
#index and create methods are working
#commented out unused methods
class CommentsController < ApplicationController
  def index
    @idea = Idea.find(params[:idea_id]) 
		@comments=Comment.where("commentable_id = ?", params[:idea_id])
  end

  #def show
   #@comment = Comment.find(params[:idea_id])
    #@idea = Idea.find(params[:idea_id])
  #end

  def new
    @idea = Idea.find(params[:idea_id])
  end

  #def edit
  #end

  def create
    @comment_hash = params[:comment]
		@idea = Idea.find(params[:comment][:commentable_id])
  	@user_who_commented = User.find_by_id(@current_user)
  	@comment = Comment.build_from(@idea, @user_who_commented.id, @comment_hash[:body])
    @comment.save!
    redirect_to idea_path(@idea.id), notice: 'Comment was sucessfully posted'
  end

  #def update
    #@comment = Comment.find(params[:id])
    #@comment.update_attributes(params[:comment])
   # redirect_to idea_comment_path(@comment.idea_id,@comment.id), notice: 'Comment was sucessfuly edited' 
  #end

  #def destroy
   # @comment = Comment.find(params[:id])
    #@comment.destroy
  #end
end
