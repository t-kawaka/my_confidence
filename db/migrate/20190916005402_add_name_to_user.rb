class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, default: "", null: false
    add_column :users, :icon, :string
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
