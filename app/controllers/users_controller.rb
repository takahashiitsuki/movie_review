class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = current_user
    @reviews = @user.reviews
  end

  def update
    current_user.update(user_params)
    redirect_to user_path
  end

  def unsubscribe
  end

  def withdraw
    current_user.update(is_deleted: true)
    reset_session
    redirect_to  root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :is_deleted)
  end

  def ensure_guest_user
    if current_user.name == "guestuser"
      redirect_to user_path , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
