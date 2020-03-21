class Product < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true

end
