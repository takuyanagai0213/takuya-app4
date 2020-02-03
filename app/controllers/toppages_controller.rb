class ToppagesController < ApplicationController
  def index
    @user = User.find_by(params[:id])  
    @posts = Post.all.page(params[:page])
  end
end
