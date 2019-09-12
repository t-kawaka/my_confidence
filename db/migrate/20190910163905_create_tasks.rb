class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, limit: 30
      t.text :description, null: false
      t.datetime :start_time, default: -> { "now()" }, null: false
      t.text :notice
      t.integer :require_time, null: false
      t.string :progress, default: "開始", null: false

      t.timestamps
    end
  end
end
