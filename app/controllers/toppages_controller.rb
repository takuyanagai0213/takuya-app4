class ToppagesController < ApplicationController
  def index
    @user = User.find_by(params[:id])  
    @posts = Post.all.page(params[:page]).page(params[:page]).per(5)
    @categories = Category.all
  end
end
