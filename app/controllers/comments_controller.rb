class CommentsController < ApplicationController
  #before_action :correct_user, only: [:destroy]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comments = @post.comments.all
    @comment.user = current_user
    if @comment.save
      flash[:success] = "コメントしました。"
      redirect_back(fallback_location: posts_path)
    else
      flash[:danger] = "コメントできませんでした。"
      redirect_back(fallback_location: posts_path)
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "コメントを削除しました。"
    redirect_to root_url
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
