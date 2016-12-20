class TodoList < ApplicationRecord
  has_many :tasks, -> {distinct}

  def updateTasks(task)
    self.tasks << task
    self.tasks.uniq
    self.save
  end

end
