class RecruitmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @recruitments = Recruitment.order(id: 'DESC')
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    if @recruitment.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:title, :game_title, :content).merge(user_id: current_user.id)
  end


end
