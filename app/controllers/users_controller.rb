class UsersController < ApplicationController
  def index
    @users = User.all.order(id: "DESC").page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

　def create
    ContactMailer.contact_mail(@contact).deliver_now
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :icon, :admin)
  end
end
