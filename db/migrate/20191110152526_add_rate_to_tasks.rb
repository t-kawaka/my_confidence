class AddRateToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :rate, :float, default: "", null: false
  end
end
