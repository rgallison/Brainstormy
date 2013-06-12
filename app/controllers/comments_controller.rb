#Lindsey Stratton
#April 19 
#index and create methods are working
#commented out unused methods
class CommentsController < ApplicationController
  def index
    @idea = Idea.find(params[:idea_id]) 
		@comments=Comment.where("idea_id = ?", params[:idea_id])
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
    params[:comment][:idea_id]=params[:idea_id]
    @comment = Comment.create(params[:comment])
    @idea = Idea.find(params[:idea_id])
    @comment.save
    redirect_to idea_path(@idea.id), notice: 'Comment was sucessfully posted'
  end

  def upvote
		id = params[:id]
		@comment = Comment.find(id)
		@idea = @comment.idea
    @voter = get_current_user
		@comment.liked_by @voter
    upvotes = @comment.upvotes.size
    downvotes = @comment.downvotes.size
    negranking = upvotes - downvotes
    @comment.rank = negranking
    @comment.save
		redirect_to idea_path(@idea.id), notice: 'You have successfully upvoted this comment'
end

	def downvote
		id = params[:id]
		@comment = Comment.find(id)
		@idea = @comment.idea
    @voter = get_current_user
		@comment.downvote_from @voter
    upvotes = @comment.upvotes.size
    downvotes = @comment.downvotes.size
    negranking = upvotes - downvotes
    @comment.rank = negranking
    @comment.save
		redirect_to idea_path(@idea.id), notice: 'You have successfully downvoted this comment'
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
