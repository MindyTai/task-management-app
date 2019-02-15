class ChangeTagNameToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :tags, :tag_name, :name
  end
end
