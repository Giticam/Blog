class PostsController < ApplicationController
  before_action :find_post, only:[:show,:edit,:update,:destroy]
  before_action :authenticate_user, except:[:index, :show]
  before_action :authorize_user, only: [:edit, :update,:destroy]

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

    def find_post
      @post = Post.find params[:id]
    end

    def authorize_user
      unless can? :manage, @post
      redirect_to root_path, alert: "access denied"
      end
    end
end
