class AddServiceToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :service, :string
  end
end
