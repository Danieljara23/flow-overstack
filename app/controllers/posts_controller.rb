class PostsController < ApplicationController
  before_action :find_post, only: [:edit,:show,:update,:destroy]
  before_action :authenticate_user!,only: [:create,:destroy,:update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = 'The post have been saved'
      redirect_to post_path(id: @post.id, it_was: 'created')
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Store was successfully updated'
      redirect_to post_path(id: @post.id, it_was: 'updated')
    else
      render edit
    end
  end

  def edit
    if current_user != @post.user
      flash[:alert] = "I'm sorry, you are not the autor of this post" 
      redirect_to root_path
    end
  end

  def index
    @posts = Post.all
  end

  def show
    find_comments
    @comment = Comment.new
  end

  def destroy
    if current_user != @post.user
      flash[:alert] = "I'm sorry, you are not the autor of this post" 
      redirect_to root_path
    else
      @post.destroy
      flash[:notice] = 'Post was successfully deleted.'
      redirect_to posts_path 
    end
    
  end

  private

  def post_params
    params.require(:post).permit(:title,:content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def find_comments
    @comments = Comment.where(post_id: params[:id])
  end
end
