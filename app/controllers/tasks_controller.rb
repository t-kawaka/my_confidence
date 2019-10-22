class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @points = current_user.points
    @tasks = current_user.tasks.recent.includes([:task_tags, :tags])
    @task = current_user.tasks.includes(:user)
  end

  def new
    @task = Task.new
  end

  def show
    @comments = @task.comments.includes(:user)
    @comment = @task.comments.build
    @task_favorite = current_user.task_favorites.find_by(task_id: @task.id)
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
    if @task.user_id != current_user.id
      redirect_to tasks_path, notice: "アクション編集の許可がありません."
    end
    @tag_ids = @task.task_tags.pluck(:tag_id)
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
    @progress = { 開始: '開始', 途中: '途中', 完了: '完了' }
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result.recent.page(params[:page])

    if params[:start_time]
      @tasks = current_user.tasks.start_time.page(params[:page])
    end

    if params[:progress]
      @tasks = current_user.tasks.progress.page(params[:page])
    end
  end

  def record
    @tasks = current_user.tasks.includes(:user)
    @task_start = current_user.tasks.where(progress: "開始")
    @task_halfway = current_user.tasks.where(progress: "途中")
    @task_finish = current_user.tasks.where(progress: "完了")
  end

  def ranking
    @tasks = user.tasks.includes(:user)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_time, :notice, :require_time, :progress, points_attributes: [:name],tag_ids: []).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
