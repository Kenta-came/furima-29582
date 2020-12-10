class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @items = user.items
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :first_name, :last_name, :firat_name_kana, :last_name_kana, :birthday)
  end
end
