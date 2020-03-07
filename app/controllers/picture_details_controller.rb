class PictureDetailsController < ApplicationController
  def new
    @id = params[:id]
    @picture = PictureDetail.new
  end

  def create
    @id = params[:id]
    @post = current_user.posts.find(params[:id])
    @picture = @post.picture_details.build(picture_detail_params)
    if @picture.save
      flash[:success] = '画像を投稿しました。'
      redirect_to post_path(@post)
    else
      flash[:danger] = '画像の投稿に失敗しました。'
      render :new, id: @post
    end
  end

  private
  
  def picture_detail_params
    params.require(:picture_detail).permit(:image1) if params[:picture_detail]
  end
end