class AddAssignedToToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :assigned_to, :string
  end
end
