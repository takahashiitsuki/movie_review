class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.is_deleted == false
    @user.update(is_deleted: true)
    else
      @user.update(is_deleted: false)
    end
    redirect_to admin_user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :is_deleted)
  end
end
