class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text            :name, null: false
      t.integer         :pice, null: false
      t.text            :introduction, null: false
      t.integer         :seller_id, null: false, foreign_key: true
      t.integer         :buyer_id, foreign_key: true
      t.integer         :large_category_id, foreign_key: true
      t.integer         :medium_category_id, foreign_key: true
      t.integer         :small_category_id, foreign_key: true
      t.integer         :size_id, foreign_key: true
      t.integer         :brand_id, foreign_key: true
      t.string          :condition, null: false
      t.string          :deal_condition, null: false
      t.integer         :delivery_id, foreign_key: true
      t.datetime        :created_at, null: false
      t.datetime        :updated_at, null: false
      t.timestamps
    end
  end
end
