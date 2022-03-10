class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to recruitment_path(params[:recruitment_id])
    end
    binding.pry
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, recruitment_id: params[:recruitment_id])
  end

end
