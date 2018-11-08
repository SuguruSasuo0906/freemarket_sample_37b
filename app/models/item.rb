class Item < ApplicationRecord
  belongs_to :user
  belongs_to :seller_id, class_name: 'User'
  belongs_to :buyer_id, class_name: 'User'
  has_many   :photos, dependent: :destroy
  belongs_to :large_category
  belongs_to :medium_category
  belongs_to :small_category
  belongs_to :size
  belongs_to :brand
  has_one :delivery, dependent: :destroy
  has_one :deal, dependent: :destroy
end
