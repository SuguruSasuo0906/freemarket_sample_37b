class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string  :customer_id,    null:false
      t.integer :user_id,        null:false, foreign_key: true
      t.timestamps
    end
  end
end
