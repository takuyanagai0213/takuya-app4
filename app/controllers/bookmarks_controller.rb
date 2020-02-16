class BookmarksController < ApplicationController
  before_action :require_user_logged_in
  def create
    post =Post.find(params[:post_id])
    current_user.bookmark(post)
    flash[:success] = 'ブックマークしました。'
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unbookmark(post)
    flash[:success] = 'ブックマークを解除しました。'
    redirect_to post_path(post)
  end
end
