class CommentsController < ApplicationController
  before_action :authenticate_user!
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
    @id_comment = Comment.find(params[:id]).id
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment: params[:comment][:comment])
      @id_comment = @comment.id
    else
      @status = 'fail'
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
    params.require(:comment).permit(:task_id, :content)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
