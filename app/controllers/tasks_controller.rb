class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all.order(start_time: 'desc')
    @points = Point.all
  end

  def new
    @task = Task.new
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "アクション「#{@task.title}」を作成しました"
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "アクション「#{@task.title}」を更新しました"
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "アクション「#{@task.title}」を削除しました"
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_time, :notice, :require_time, :progress, points_attributes: [:name])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
