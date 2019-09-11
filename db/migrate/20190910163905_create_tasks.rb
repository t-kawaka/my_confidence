class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, limit: 30
      t.text :description, null: false
      t.datetime :start_time, default: -> { "now()" }, null: false

      t.timestamps
    end
  end
end
