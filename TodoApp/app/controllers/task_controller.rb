class TaskController < ApplicationController

  def index
    @tasks = Task.all()
  end

  def new
    @task = Task.new()
    @name = findList.name
  end

  def create
    @list = findList
    task_params[:todo_list_id] = @list.id


    @task = Task.new(task_params)
    @list.updateTasks(@task)
    if @task.save
      redirect_to action: "show", controller: "todo_list", id: @list.id
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
    @list = findList
    task_params[:todo_list_id] = @list.id
    @task = Task.find(params[:id])
    begin
      @task.update(task_params)
      @list.updateTasks(@task)
      redirect_to(:action => "show", controller: "todo_list" ,:id => @list.id)
    rescue Exception => e
      puts e.backtrace
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @list = findList
    puts @list.name

    if @list.tasks.length > 0
      @list.tasks.delete(@task)
    end
    @task.destroy()

    redirect_back(fallback_location: list_path)

  end

  private
    def task_params
      params.require(:task).permit(:name)
    end

    def findList
      TodoList.find(params[:todo_list_id])
    end


end
