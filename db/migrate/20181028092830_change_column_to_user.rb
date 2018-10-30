class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :family_name, :string, null: true
    change_column :users, :first_name, :string, null: true
    change_column :users, :family_name_kana, :string, null: true
    change_column :users, :first_name_kana, :string, null: true
    change_column :users, :introduction, :text, null: true
    change_column :users, :birthday, :date, null: true
    remove_column :users, :address_id, :integer
  end
end
