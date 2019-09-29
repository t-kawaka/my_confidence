class UsersController < ApplicationController
  def index
    @users = User.all.order(id: "DESC").page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    #@users = User.all.order(id: "DESC").page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :icon, :admin)
  end
end
