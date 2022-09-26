class Users::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
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
    params.require(:customer).permit(:email, :name, :is_deleted)
  end

end
