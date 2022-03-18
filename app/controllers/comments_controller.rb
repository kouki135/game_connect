class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @recruitment = Recruitment.find(params[:recruitment_id])
    if @comment.save
      CommentChannel.broadcast_to @recruitment, { comment: @comment, user: @comment.user }
      # redirect_to recruitment_path(params[:recruitment_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, recruitment_id: params[:recruitment_id])
  end

end
