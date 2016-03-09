class CommentsController < ApplicationController

  before_action :authorize_user, only:[:destroy]

  # def new
  #   @comment = Comment.new
  # end
  def create
    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new(comment_params)
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

    @comment = Comment.find params[:id]
    if @comment.user == current_user || @post.user == current_user
      @comment.destroy
      redirect_to post_path(params[:post_id]), notice: "Comment Deleted!"
    else
      flash[alert] = "Access denied!"
      render "/posts/show"
    end
  end

  private
  def authorize_user
    unless can? :manage, @comment
    redirect_to root_path, alert: "access denied"
    end
  end
end
