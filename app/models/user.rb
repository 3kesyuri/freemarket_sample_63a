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
  validates :nickname, presence: true, length: { in: 1..20, message: 'ニックネームを1〜20文字で入力してください'}
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠Ａ-Ｚ]+\z/i, message: '姓を全角で入力してください'}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠Ａ-Ｚ]+\z/i, message: '名を全角で入力してください'}
  validates :family_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, message: '姓のフリガナを全角カタカナで入力してください'}
  validates :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, message: '名のフリガナを全角カタカナで入力してください'}
  validates :birth_year, :birth_month, :birth_day, presence: true, format: { with: /\A[0-9]+\z/, message: '生年月日を入力してください'}
end