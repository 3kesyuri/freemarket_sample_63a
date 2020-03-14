class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to_active_hash :prefecture
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true

  validates :name, presence: true, length: { in: 1..40, message: '商品名を1〜40文字で入力してください'}
  validates :description, presence: true, length: { in: 1..1000, message: '商品の説明を1〜1000文字で入力してください'}
  validates :category_id, presence: true
  validates :condition, presence: true, format: { with: /\A(?!.*選択してください).*\z/, message: '選択してください'}
  validates :delivery_charge, presence: true, format: { with: /\A(?!.*選択してください).*\z/, message: '選択してください'}
  validates :delivery_origin, presence: true, format: { with: /\A(?!.*選択してください).*\z/, message: '選択してください'}
  validates :shipping_date, presence: true, format: { with: /\A(?!.*選択してください).*\z/, message: '選択してください'}
  validates :price, presence: true, format: { with: /\A([3-9][0-9]{2}|[1-9][0-9]{3,6})\z/, message: '300以上9999999以下で入力してください'}
end

# 画像は1枚以上必須
# 画像は複数枚投稿することができる
# 商品名が必須
# 商品の説明が必須
# カテゴリーの情報が必須
# ブランドについての情報は任意
# 商品の状態についての情報が必須
# 配送料の負担についての情報が必須
# 発送元の地域についての情報が必須
# 発送までの日数についての情報が必須
# 価格についての情報が必須

# validates :content, presence: true, unless: :image?
# mount_uploader :image, ImageUploader

