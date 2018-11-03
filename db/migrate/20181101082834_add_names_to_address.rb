class AddNamesToAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :family_name, :string, null: false
    add_column :addresses, :first_name, :string, null: false
    add_column :addresses, :family_name_kana, :string, null: false
    add_column :addresses, :first_name_kana, :string, null: false
    change_column :addresses, :prefecture, :integer, null: false
    change_column :addresses, :telephone, :string
  end
end
