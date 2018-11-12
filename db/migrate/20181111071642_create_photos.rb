class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string   :photo_url, null: false
      t.integer  :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
