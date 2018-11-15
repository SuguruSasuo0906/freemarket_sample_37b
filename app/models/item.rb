class Item < ApplicationRecord
  belongs_to :user
  has_many   :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
  belongs_to :large_category, optional: true
  belongs_to :medium_category, optional: true
  belongs_to :small_category, optional: true
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  has_one :delivery, dependent: :destroy
  accepts_nested_attributes_for :delivery
  # has_one :deal, dependent: :destroy

  validates :name, presence: true,length: { maximum: 40 }
  validates :introduction, length: { maximum: 1000 } ,presence: true
  validates :condition, presence: true
  validates :deal_condition, presence: true
  validates :price, presence: true, numericality:{ greater_than: 299, less_than: 10000000}, presence: true
  validates :user_id, presence: true

  enum condition: {
    "新品、未使用" => 1, 未使用に近い:2, 目立った傷や汚れなし:3, やや傷や汚れあり:4, 傷や汚れあり:5, 全体的に状態が悪い:6
  }
  enum deal_condition: {
    出品中:1, 取引中:2, 売却済み:3
  }

end
