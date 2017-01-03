class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :media
      t.string :sender
      t.jsonb :recipients
      t.string :recipient_type
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
