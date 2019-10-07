class PointsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_point, only: %i[edit update destroy]

  def new
    @point = current_user.points.new
  end

  def create
    @point = current_user.points.build(point_params)
    if @point.save
      flash[:notice] = "重点的に取り組んでいること「#{@point.name}」を作成しました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    if @point.user_id != current_user.id
      redirect_to root_path, notice: "重点的に取り組んでいることの編集許可がありません."
    end
  end

  def update
    if @point.user_id == current_user.id
      if @point.update(point_params)
        flash[:notice] = "重点的に取り組んでいること「#{@point.name}」を編集しました"
        redirect_to root_path
      else
        render 'edit'
      end
    else
      redirect_to root_path, notice: "重点的に取り組んでいることの編集許可がありません."
    end
  end

  def destroy
    if @point.user_id == current_user.id
      @point.destroy
      flash[:notice] = "重点的に取り組んでいること「#{@point.name}」を削除しました"
      redirect_to tasks_path
    else
      redirect_to root_path, notice: "削除許可がありません."
    end
  end

  private
  def point_params
    params.require(:point).permit(:name)
  end

  def set_point
    @point = Point.find(params[:id])
  end
end
