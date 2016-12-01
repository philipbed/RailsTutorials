class TodoListController < ApplicationController
  def index
    @lists = TodoList.all()
    @list = TodoList.new
  end

  def create
    @list = TodoList.create(list_params)
    @lists = TodoList.all()
  end

  def show
    @task = TodoList.find(params[:id])
  end

  private
  def list_params
    params.permit(:name)
  end

end
