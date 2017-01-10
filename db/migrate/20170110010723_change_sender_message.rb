class ChangeSenderMessage < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :sender, :sender_number
    add_column :messages, :sender_name, :string
  end
end
