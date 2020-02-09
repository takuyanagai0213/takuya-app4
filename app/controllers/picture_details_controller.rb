class PictureDetailsController < ApplicationController
  def new
    @picture = PictureDetail.new
  end

  def create
    @picture = PictureDetail.new
    if @picture.save
      flash[:success] = '画像を投稿しました。'
      redirect_to 'posts/show'
    else
      # flash.now[:danger] = '画像の投稿に失敗しました。'
      # render :new
    end
  end
end