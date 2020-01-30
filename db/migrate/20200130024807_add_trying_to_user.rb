class AddTryingToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :trying, :boolean, default: false, null: false
  end
end
