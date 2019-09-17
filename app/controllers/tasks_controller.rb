class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = current_user.tasks.includes(:user).order(start_time: 'desc')
    @points = Point.all
  end

  def new
    @task = Task.new
  end

  def show
    @comments = @task.comments
    @comment = @task.comments.build
  end

  def create
    @task = current_user.tasks.new(task_params)
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
    if @task.user_id == current_user.id
      if @task.update(task_params)
        flash[:notice] = "アクション「#{@task.title}」を更新しました"
        redirect_to @task
      else
        render 'edit'
      end
    end
  end

  def destroy
    if @task.user_id == current_user.id
      @task.destroy
      flash[:notice] = "アクション「#{@task.title}」を削除しました"
      redirect_to tasks_path
    end
  end

  def list
    @tasks = current_user.tasks.includes(:user).order(start_time: 'desc')
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_time, :notice, :require_time, :progress, points_attributes: [:name])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
