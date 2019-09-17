class PointsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_point, only: %i[edit update destroy]

  def new
    @point = Point.new
  end

  def create
    @point = task.points.build(point_params)
    if @point.save
      flash[:notice] = "重点的に取り組んでいること「#{@point.name}」を作成しました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @point.update(point_params)
      flash[:notice] = "重点的に取り組んでいること「#{@point.name}」を編集しました"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @point.destroy
    flash[:notice] = "重点的に取り組んでいること「#{@point.name}」を削除しました"
    redirect_to tasks_path
  end

  private
  def point_params
    params.require(:point).permit(:task_id, :name)
  end

  def set_point
    @point = Point.find(params[:id])
  end
end
