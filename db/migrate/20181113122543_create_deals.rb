class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.integer   :user_id, null: false, foreign_key: true
      t.integer   :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
