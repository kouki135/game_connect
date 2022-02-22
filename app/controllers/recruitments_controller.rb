class RecruitmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @recruitments = Recruitment.order(updated_at: 'DESC')
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

  def destroy
    @recruitment = Recruitment.find(params[:id])
    if current_user.id == @recruitment.user_id
      @recruitment.destroy
      redirect_to root_path
    end
  end

  def edit
    @recruitment = Recruitment.find(params[:id])
    redirect_to action: :index if current_user.id != @recruitment.user_id
  end

  def update
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(recruitment_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:title, :game_title, :content).merge(user_id: current_user.id)
  end


end
