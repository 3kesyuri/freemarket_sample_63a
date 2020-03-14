class Destination < ApplicationRecord
  belongs_to :user

  validates :family_name,
  presence: true,
  format: { with: /\A[ぁ-んァ-ヶー一-龠々Ａ-Ｚa-z]+\z/i}
  
  validates :last_name,
  presence: true,
  format: { with: /\A[ぁ-んァ-ヶー一-龠々Ａ-Ｚa-z]+\z/i}

  validates :family_name_kana,
  presence: true,
  format: { with: /\A([ァ-ン]|ー)+\z/}
  
  validates :last_name_kana,
  presence: true,
  format: { with: /\A([ァ-ン]|ー)+\z/}
  
  validates :zip_code,
  presence: true,
  length: {minimum: 7, maximum: 7},
  format: {with: /\A[0-9]+\z/}
  
  validates :prefecture,
  presence: true,
  format: {with: /\A[一-龠々]+\z/} 
  
  validates :municipality,
  presence: true

  validates :address,
  presence: true

 
end
