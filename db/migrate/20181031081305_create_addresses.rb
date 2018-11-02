class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :postal_code,              null: false
      t.string :prefecture,               null: false
      t.string :city,                     null: false
      t.string :street_number,            null: false
      t.string :building
      t.integer :telephone
      t.integer :user_id,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
