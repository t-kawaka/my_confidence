class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.order(id: "DESC").page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :icon, :icon_cache, :remove_icon, :admin, :status, :introduce, tasks_attributes: [:id, :title, :description, :start_time, :notice, :require_time, :progress])
  end
end
