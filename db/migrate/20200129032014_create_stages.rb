class CreateStages < ActiveRecord::Migration[5.2]
  def change
    create_table :stages do |t|
      t.references :goal, foreign_key: true
      t.string :title, null: false
      t.date :start, null: false
      t.date :end, null: false
      t.string :detail
      t.boolean :status, default: false, null: false
      t.timestamps
    end
  end
end