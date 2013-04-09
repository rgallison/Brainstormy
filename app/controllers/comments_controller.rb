#Lindsey Stratton
#April 8
#making the comment controller
#(yet I don't have to make the model because someone already made it?)
class CommentsController < ApplicationController
    def index
    @comments = Comment.all
    @idea = Idea.find(params[:idea_id])
    end

    def show
    @comment = Comment.find(params[:idea_id])
    @idea = Idea.find(params[:idea_id])
    end

    def new
    @idea = Idea.find(params[:idea_id])
    end

    def edit
    end

    def create
    @comment = Comment.new(params[:comment])
    @comment.save
    redirect_to idea_comment_path(@comment.idea_id,@comment.id), notice: 'Comment was sucessfuly posted'
    end

    def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    redirect_to idea_comment_path(@comment.idea_id,@comment.id), notice: 'Comment was sucessfuly edited' 
    end

    def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    #redirect_to user_userblog_path
    end
end
