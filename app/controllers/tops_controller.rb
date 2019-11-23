class TopsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to tasks_path
    else
      @tasks = Task.all.order(created_at: :desc).limit(3)
    end
  end
end
