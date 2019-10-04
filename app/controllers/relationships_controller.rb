class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js
  def create
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      @user # @userをjs.erbに渡すための記述です。
      redirect_to users_path
    else
      @user
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    @user
    redirect_to users_path
  end
end
