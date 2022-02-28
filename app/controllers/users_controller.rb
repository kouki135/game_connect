class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to action: :show
    else
      binding.pry
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,  :email, :gender, :favorite_game_title, :self_introduction, :birthday)
  end


end