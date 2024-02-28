class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update]
  before_action :redirect_if_not_author, only: [:edit]

  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :category_id, :place_id, :execution_date).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def redirect_if_not_author
    unless current_user == @post.user
      redirect_to root_path
    end
  end
end
