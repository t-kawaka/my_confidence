class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: %i[show edit update destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path, notice: "アクションタグを保存しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path, notice: "アクションタグを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, notice: "アクションタグを削除しました"
  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
