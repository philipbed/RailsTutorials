class TaskController < ApplicationController

  def index
    @tasks = Task.all()
  end

  def new
    @task = Task.new()
  end

  def create

    if Task.create(task_params)
      redirect_to action:"index"
    else
      render "new"
    end

  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])

  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to(:action => "show", :id => @task.id)
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy()
    if @task.destroyed?
      redirect_to(:action => "index")
    else
      render "show"
    end
  end

  private
    def task_params
      params.require(:task).permit(:name)
    end

end
