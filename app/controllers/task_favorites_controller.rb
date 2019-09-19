class TaskFavoritesController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    task_favorite = current_user.task_favorites.build(task_id: params[:task_id])
    task_favorite.save
    redirect_to tasks_path, notice: "#{task_favorite.task.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    task_favorite = current_user.task_favorites.find_by(id: params[:id]).destroy
    redirect_to tasks_path, notice: "#{task_favorite.task.user.name}さんの投稿のお気に入りを解除しました"
  end
end
