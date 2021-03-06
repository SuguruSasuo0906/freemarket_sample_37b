# encording: UTF-8
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one :address, dependent: :destroy
  has_one :payment, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :deals, dependent: :destroy

  validates :nickname,
  presence: true,
  uniqueness: { case_sensitive: :false },
  length: { maximum: 20 }

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        nickname: auth.info.name,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20])
    end
    user
  end

  def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first
    unless user
      user = User.create(nickname: auth.info.name,
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      token: auth.credentials.token,
      password: Devise.friendly_token[0, 20])
    end
    user
  end
end
