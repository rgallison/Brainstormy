#Lindsey Stratton
#April 8
#making the comment controller
#(yet I don't have to make the model because someone already made it?)
class CommentsController < ApplicationController
  # skip_before_filter :set_current_user
  def index
    @comments = Comment.all
    @idea = Idea.find(params[:idea_id])
  end

  # skip_before_filter :set_current_user
  def show
    @comment = Comment.find(params[:idea_id])
    @idea = Idea.find(params[:idea_id])
  end

  # skip_before_filter :set_current_user
  def new
    @idea = Idea.find(params[:idea_id])
  end

  # skip_before_filter :set_current_user
  def edit
  end

  # skip_before_filter :set_current_user
  def create
    @comment = Comment.new(params[:comment])
    @comment.save
    redirect_to idea_comment_path(@comment.idea_id,@comment.id), notice: 'Comment was sucessfuly posted'
  end

  # skip_before_filter :set_current_user
  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    redirect_to idea_comment_path(@comment.idea_id,@comment.id), notice: 'Comment was sucessfuly edited' 
  end

  # skip_before_filter :set_current_user
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    #redirect_to user_userblog_path
  end
end
