class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :gender_id, :favorite_game_title, :self_introduction, :birthday)
  end


end