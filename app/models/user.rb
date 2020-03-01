class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :destinations
  has_many :products
  has_many :credit_cards
  has_many :purchases

  devise :validatable, password_length: 7..128
  devise :validatable, email_regexp: /\A\S[a-z\d]+@\S[a-z\d]+\.\S+\z/
  validates :nickname, presence: true, length: { in: 1..20}
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠Ａ-Ｚ]+\z/i}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠Ａ-Ｚ]+\z/i}
  validates :family_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :birth_year, presence: true, format: { with: /\A(1[0-9]{3}|2[0-9]{3})+\z/}
  validates :birth_month, presence: true, format: { with: /\A(0[1-9]{1}|1[0-2]{1})+\z/}
  validates :birth_day, presence: true, format: { with: /\A(0[1-9]{1}|1[0-9]{1}|2[0-9]{1}|3[0-1]{1})+\z/}
end