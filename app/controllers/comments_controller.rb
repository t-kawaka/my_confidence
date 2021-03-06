class CommentsController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.js { render :error }
      end
    end
  end

  def edit
    if @comment.user_id != current_user.id
      redirect_to tasks_path, notice: "コメントの編集許可がありません"
    end
  end

  def update
    if @comment.user_id == current_user.id
      if @comment.update(comment_params)
        redirect_to task_path(@task), notice: "コメントが更新されました"
      else
        flash[:alert] = "コメントが空欄になっています。"
        render :edit
      end
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.js { render :index }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:task_id, :content)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
