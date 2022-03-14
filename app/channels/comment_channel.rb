class CommentChannel < ApplicationCable::Channel
  def subscribed
    @recruitment = Recruitment.find(params[:recruitment_id])
    stream_for @recruitment
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
