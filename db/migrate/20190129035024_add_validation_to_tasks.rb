class AddValidationToTasks < ActiveRecord::Migration[5.2]
  def change
    remove_columns :tasks, :title, :description, :end_time, :status
    add_column  :tasks, :title, :text, :null => false, :limit => 2
    add_column :tasks, :description, :text, :null => false
    add_column :tasks, :end_time, :datetime, :null => false
    add_column :tasks, :status, :string, :null => false
  end
end