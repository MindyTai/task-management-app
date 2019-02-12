class ChangeTagDataTypeToTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :name, :integer
    add_column :tags, :name, :string
  end
end
