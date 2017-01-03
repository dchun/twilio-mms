class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :service_id
      t.string :authentication_token
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
