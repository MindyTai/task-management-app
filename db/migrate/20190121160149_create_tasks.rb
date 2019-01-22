class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.datetime :end_time
      t.integer :status
      t.integer :priority

      t.timestamps
    end
  end
end
