class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :redirect_if_not_author, only: [:edit]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      @post = @comment.post
      @comments = @post.comments
      render "posts/show"
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def redirect_if_not_author
    unless current_user == @comment.user
      redirect_to root_path
    end
  end
end
