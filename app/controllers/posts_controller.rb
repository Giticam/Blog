class PostsController < ApplicationController
  before_action :find_post, only:[:show,:edit,:update,:destroy]
  

  def index
    if params[:search]
      @posts = Post.search(params[:search]).order("id DESC")
    else
      @posts = Post.paginate(:page => params[:page], :per_page => 15  )
    end
  end

  def show
    @comment = Comment.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to posts_path, notice: "Post Created"
    else
      render :new
    end
  end

  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to new_session_path, alert: "You are not signed in!"
    end
  end

  def edit
    if can?:manage, @post
      render :edit
    else
      redirect_to @post, alert: "You are not authorized to edit this post.!"
    end
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post), notice: "Post Updated"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  private

  def post_params
    post_params = params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find params[:id]
  end
end
