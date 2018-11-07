class Address < ApplicationRecord
  belongs_to :user
  enum prefecture: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47,未定:48
  }

VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
VALID_POST_REGEX = /\A\d{3}[-]\d{4}\z/
VALID_KANA_NAME =  /\A[\p{katakana}\p{blank}ー－]+\z/
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true,format: { with: VALID_KANA_NAME,message: 'カナはカタカナで入力して下さい。'}
  validates :first_name_kana, presence: true,format: { with: VALID_KANA_NAME,message: 'カナはカタカナで入力して下さい。'}
  validates :postal_code,presence: true, format: { with: VALID_POST_REGEX, message: '数字3桁-数字4桁で入力してください' }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :street_number, presence: true
  validates :telephone, format: { with: VALID_PHONE_REGEX, message: '10桁または11桁の数字を入力してください', allow_blank: true }
  validates :user_id, uniqueness: true
end
