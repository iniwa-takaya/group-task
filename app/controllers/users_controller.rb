class UsersController < ApplicationController
  def new
  end

  def show
  end

  def edit
    if current_user.email == "guest@example.com"
      redirect_to user_path(current_user), notice: 'ゲストユーザーはユーザー情報を編集できません。'
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :email, :image, :group_number)
  end
end
