class AddIntroduceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduce, :text, default: "", null: false
  end
end
