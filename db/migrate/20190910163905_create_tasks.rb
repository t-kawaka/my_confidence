class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :start_time

      t.timestamps
    end
  end
end
