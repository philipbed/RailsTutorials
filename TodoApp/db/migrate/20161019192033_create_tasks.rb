class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :name
      t.references :todo_list
      t.timestamps
    end
  end
end
