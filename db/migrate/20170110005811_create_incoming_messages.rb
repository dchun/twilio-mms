class CreateIncomingMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :incoming_messages do |t|
      t.string :sid
      t.string :number
      t.text :content
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
    add_index :incoming_messages, :sid
    add_index :incoming_messages, :number
  end
end
