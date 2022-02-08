class PostsController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def index
    @posts = Post.page(params[:page]).reverse_order
    @user = current_user
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      @posts = Post.find(params[:id])
      render 'index'
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'index'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to posts_path
    end
  end

end
