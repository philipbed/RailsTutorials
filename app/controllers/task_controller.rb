class TaskController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create

    if Task.create(task_params)
      redirect_to action:"index"
    else
      render "new"
    end

  end

  private
    def task_params
      params.require(:task).permit(:name)
    end

end
