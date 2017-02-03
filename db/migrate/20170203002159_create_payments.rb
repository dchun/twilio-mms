class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :email
      t.string :description
      t.decimal :amount, precision: 8, scale: 2
      t.string :card_token
      t.string :customer_token
      t.belongs_to :plan, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
