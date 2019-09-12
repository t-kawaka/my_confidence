class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.string :name, null: false
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
