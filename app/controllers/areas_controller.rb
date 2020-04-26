class AreasController < ApplicationController
    def show
        @area = Area.find_by(id: params[:id])
        @area_posts = @area.posts.all
        @posts = Post.all.page(params[:page]).page(params[:page]).per(5)
    end
end
