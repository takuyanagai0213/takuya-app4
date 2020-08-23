class CategoriesController < ApplicationController

    def new
        @category = @categories.new
    end

    def show 
        @category = Category.find(params[:id])
        @category_posts = @category.posts.all
        @posts = Post.all.page(params[:page]).page(params[:page]).per(5)
    end

    def create
        @category = @categories.build(category_params)
        if @category.save
          flash[:success] = 'カテゴリを追加しました。'
          redirect_to root_url
        else
          flash.now[:danger] = 'カテゴリの追加に失敗しました。'
          render 'categories/new'
        end
      end

    private

    def category_params
        params.require(:category).permit(:name)
    end


end

