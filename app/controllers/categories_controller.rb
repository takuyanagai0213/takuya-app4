class CategoriesController < ApplicationController

    def show 
        @category = Category.find(params[:id])
        @category_posts = @category.posts.all
        @posts = Post.all.page(params[:page]).page(params[:page]).per(5)

    end
end
