class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy

  validates :nickname,
    presence: true,
    uniqueness: { case_sensitive: :false },
    length: { maximum: 20 }
end
