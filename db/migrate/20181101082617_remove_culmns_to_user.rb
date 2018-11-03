class RemoveCulmnsToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :family_name, :string, null: true
    remove_column :users, :first_name, :string, null: true
    remove_column :users, :family_name_kana, :string, null: true
    remove_column :users, :first_name_kana, :string, null: true
  end
end
