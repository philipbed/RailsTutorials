class TodoListController < ApplicationController
  def index
    @lists = TodoList.all()
  end
end
