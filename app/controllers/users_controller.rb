class UsersController < ApplicationController
  def index
    @users = User.all.order(id: "DESC").page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @users = current_user.active_relationships.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :icon, :icon_cache, :remove_icon, :status, tasks_attributes: [:id, :title, :description, :start_time, :notice, :require_time, :progress])
  end
end
