class RecruitmentsController < ApplicationController
  def index
    @recruitments = Recruitment.new
  end

  def create
    @recruitments = Recruitment.new(recruitment_params)

  end

  private

  def message_params
    params.require(:recruitment).permit(:content, :image).merge(user_id: current_user.id)
  end


end
