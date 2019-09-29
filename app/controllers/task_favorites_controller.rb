class TaskFavoritesController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    @task_favorite = current_user.task_favorites.create(task_id: params[:task_id])
  end

  def destroy
    @task_favorite = current_user.task_favorites.find_by(id: params[:id]).destroy
  end
end
