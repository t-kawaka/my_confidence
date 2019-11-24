class TopsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to tasks_path
    else
      @users = User.where(status: 1).order(created_at: :asc).limit(3)
      @tasks = Task.all.order(start_time: :desc)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :icon, :icon_cache, :remove_icon, :admin, :status, :introduce, tasks_attributes: [:id, :title, :description, :start_time, :notice, :require_time, :progress])
  end
end
