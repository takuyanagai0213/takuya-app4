class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '釣果を投稿しました。'
      redirect_to root_url
    else
      @posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '釣果の投稿に失敗しました。'
      render 'posts/new'
    end
  end



  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "更新しました。"
      redirect_to @post
    else
      flash.now[:danger] = "更新できませんでした。"
      redirect_to edit_post_path
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: root_url)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content, :detail, :picture)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
