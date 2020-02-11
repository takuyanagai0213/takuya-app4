class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comments = @post.comments.all
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました。"
      redirect_back(fallback_location: posts_path)
    else
      flash[:danger] = "コメントできませんでした。"
      redirect_back(fallback_location: posts_path)
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
