class CommentsController < ApplicationController

  load_and_authorize_resource :post
  load_and_authorize_resource :comment, through: :post

  # def new
  #   @comment = Comment.new
  # end
  def create
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post), notice: "Comment Created"
    else
      render "/posts/show"
    end
  end

  # def index
  #   @comments = Comment.all
  # end
  # def show
  #   @comment = Comment.find params[:id]
  # end
  # def edit
  #   @comment = Comment.find params[:id]
  # end
  # def update
  #   @comment = Comment.find params[:id]
  #   comment_params = params.require(:comment).permit([:body])
  #   if @comment.update comment_params
  #     redirect_to comment_path(@comment), notice: "Comment Updated!"
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    if @comment.destroy
    redirect_to post_path(params[:post_id]), notice: "Comment Deleted!"
  else
    flash[alert] = "You are not the owner of the comment.Access denied!"
    render "/posts/show"
  end
end

private

def comment_params
  comment_params = params.require(:comment).permit(:body)
end
end
