class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.date :start, null: false
      t.date :end, null: false
      t.string :detail
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
