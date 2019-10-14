class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[destroy]
  before_action :set_comment, only: %i[destroy]

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

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.js { render :index }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:task_id, :content, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
