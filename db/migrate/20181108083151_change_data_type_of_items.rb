class ChangeDataTypeOfItems < ActiveRecord::Migration[5.1]
  def up
    remove_column :items, :delivery_id, :integer
    rename_column :items, :pice, :price
    rename_column :items, :seller_id, :user_id
    remove_column :items, :buyer_id, :integer, foreign_key: true
    change_column :items, :condition, :integer
    change_column :items, :deal_condition, :integer
  end

  def down
    add_column :items, :delivery_id, :integer
    rename_column :items, :price, :pice
    rename_column :items, :user_id, :seller_id
    add_column :items, :buyer_id, :integer, foreign_key: true
    change_column :items, :condition, :string
    change_column :items, :deal_condition, :string
  end
end
