class TodoListController < ApplicationController
  def index
    @lists = TodoList.all()
  end

  def new
    @list = TodoList.new
  end

  def create
    @list = TodoList.new(list_params)
    if @list.save
      redirect_to "/"
    else
      render "new"
    end
  end

  def show
    @task = TodoList.find(params[:id])
  end

  private
  def list_params
    params.require(:todo_list).permit(:name)
  end

end
