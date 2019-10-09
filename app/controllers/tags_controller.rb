class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: %i[show edit update destroy]

  def index
    @tags = current_user.tags.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = current_user.tags.build(tag_params)
    if @tag.save
      redirect_to tags_path, notice: "アクションタグを保存しました"
    else
      render 'new'
    end
  end

  def edit
    if @tag.user_id != current_user.id
      redirect_to tags_path, notice: "アクションタグ編集の許可がありません."
    end
  end

  def update
    if @tag.user_id == current_user.id
      if @tag.update(tag_params)
        flash[:notice] = "重点的に取り組んでいること「#{@tag.name}」を編集しました"
        redirect_to tags_path
      else
        render 'edit'
      end
    else
      redirect_to tags_path, notice: "アクションタグ編集の許可がありません."
    end
  end

  def destroy
    if @tag.user_id == current_user.id
       @tag.destroy
       flash[:notice] = "重点的に取り組んでいること「#{@tag.name}」を削除しました"
       redirect_to tags_path
    else
     redirect_to tags_path, notice: "削除許可がありません."
   end
  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
