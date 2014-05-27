class PostsController < ApplicationController

  before_action :set_post, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!, only: [:new,:edit,:update,:destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    @title = "New Post"
  end

  def edit
    @title = "Edit Post"
  end

  def create
    @post = current_user.posts.new(post_params)
    if params[:draft_button]
      @post.drafts = true
      @post.save
        redirect_to @post, notice: 'post saved as drafts'
    elsif params[:commit]
      @post.drafts = false
      @post.save
      redirect_to @post, notice: 'Post was successfully created'
    else
      render action: 'new'
    end
  end

  def update
    if @post.drafts == true
      @post.drafts = false
    end
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was Successfully Updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to home_url
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:avatar,:title,:location,:tags,:content,:user_id)
  end

end
