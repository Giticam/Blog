class PostsController < ApplicationController
  before_action :authenticate_user, except:[:index, :show]
  load_and_authorize_resource

    def index
      if params[:search]
        @posts = Post.search(params[:search]).paginate(:page => params[:page], :per_page => 15      ).order("id DESC")
      else
        @posts = Post.paginate(:page => params[:page], :per_page => 15  )
      end
    end

    def show
      @comment = Comment.new
    end

    def create
      @post = Post.new post_params
      @post.user = current_user
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


end
