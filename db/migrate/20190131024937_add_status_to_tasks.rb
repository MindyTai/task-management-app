class AddStatusToTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :status
    add_column :tasks, :status, :integer , default: 0
    add_index :tasks, :status
  end
end
