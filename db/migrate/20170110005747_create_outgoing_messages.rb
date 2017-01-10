class CreateOutgoingMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :outgoing_messages do |t|
      t.string :zid
      t.string :name
      t.string :sid
      t.string :number
      t.string :status
      t.belongs_to :message, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
    add_index :outgoing_messages, :zid
    add_index :outgoing_messages, :sid
    add_index :outgoing_messages, :number
  end
end
