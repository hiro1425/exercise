class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show]

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

  private

  def post_params
    params.require(:post).permit(:title, :text, :category_id, :place_id, :execution_date).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
