require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'can save' do
    it "all:true" do
      product = build(:product)
      expect(product).to be_valid
    end
  end

  context 'can not save' do
    it "name:false" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "description:false" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "category_id:false" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "condition:false" do
      product = build(:product, condition: nil)
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end

    it "delivery_charge:false" do
      product = build(:product, delivery_charge: nil)
      product.valid?
      expect(product.errors[:delivery_charge]).to include("を入力してください")
    end

    it "delivery_origin:false" do
      product = build(:product, delivery_origin: nil)
      product.valid?
      expect(product.errors[:delivery_origin]).to include("を入力してください")
    end

    it "shipping_date:false" do
      product = build(:product, shipping_date: nil)
      product.valid?
      expect(product.errors[:shipping_date]).to include("を入力してください")
    end

    it "price:false" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

  end
end
