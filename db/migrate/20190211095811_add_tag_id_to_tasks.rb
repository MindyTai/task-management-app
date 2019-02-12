class AddTagIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :tag_ids, :integer
  end
end
