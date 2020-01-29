class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.references :stage,  foreign_key: true
      t.string     :title,  null: false
      t.boolean    :status, default: false, null: false
      t.timestamps
    end
  end
end
