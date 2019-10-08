class UsersController < ApplicationController
  before_action :only_allow_admin

  def index
    @users = User.all.order(id: "DESC").page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @users = current_user.active_relationships.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザー登録に成功しました。"
      redirect_to admin_users_path
    else
      flash[:notice] = "ユーザー登録に成功しました。"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー「#{@user.user}」を更新しました"
      redirect_to admin_users_path
    elsif @user.admin == false && User.where(admin:true).count == 1 && @user == User.find_by(admin: true)
      flash[:notice] = "管理者が1人であるため管理者権限を外すことに失敗しました"
      render 'edit'
    else
      flash[:notice] = "ユーザー「#{@user.user}」の更新に失敗しました"
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path
      flash[:notice] = "ユーザー「#{@user.user}」を削除しました"
    else
      redirect_to admin_users_path
      flash[:notice] = "管理者が1人であるため削除に失敗しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :icon, :icon_cache, :remove_icon, :admin, :status, :introduce, tasks_attributes: [:id, :title, :description, :start_time, :notice, :require_time, :progress])
  end

  def only_allow_admin
    unless current_user.try(:admin?)
      flash[:alert] = "アクセス権限がありません"
      redirect_to tasks_path
    end
  end
end
