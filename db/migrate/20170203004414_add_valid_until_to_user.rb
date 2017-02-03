class AddValidUntilToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :valid_until, :date
  end
end
