class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.integer   :shipping_burden, null: false
      t.integer   :origin_region, null: false
      t.integer   :shipping_days, null: false
      t.integer   :shipping_method, null: false
      t.integer   :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
