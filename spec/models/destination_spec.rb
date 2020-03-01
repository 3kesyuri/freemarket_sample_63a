require 'rails_helper'

RSpec.describe Destination, type: :model do
  before do
    @user = build(:user)
    
      


  end

  context 'can save' do
    it "all:true" do
      destination = @user.destinations.build(
      family_name: "苗字",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"市町村",
      address:"12-5",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      expect(destination).to be_valid
    end
  end

  context 'can not save because nil' do
    it "family_name: none" do
      destination = @user.destinations.build(
      family_name: "",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"市町村",
      address:"12-5",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "last_name: none" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"市町村",
      address:"12-5",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "family_name_kana: none" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"",
      last_name_kana:"タロウ",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"市町村",
      address:"12-5",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "last_name_kana: none" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"市町村",
      address:"12-5",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "zip_code: none" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:"",
      prefecture:"北海道",
      municipality:"市町村",
      address:"12-5",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "prefecture: none" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:1234567,
      prefecture:"",
      municipality:"市町村",
      address:"12-5",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "municipality: none" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"",
      address:"12-5",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "address: none" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end
  end

  context 'can not save because invaild value' do
    it "family_name: int" do
      destination = @user.destinations.build(
      family_name: "1111111",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "last_name: int" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"11111",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "family_name_kana: other than kana" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"山田",
      last_name_kana:"タロウ",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "last_name_kana: other than kana" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"太郎",
      zip_code:1234567,
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "zip_code: less than 6" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:123456,
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "zip_code: more than 8" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:12345678,
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "zip_code: other than int" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:"aaaaaa",
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:12345678910,
      user_id: 1
      )
      destination.valid?
    end

    it "phone_number: less than 9" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:"1234567",
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:123456789,
      user_id: 1
      )
      destination.valid?
    end

    it "phone_number: more than 16" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:"1234567",
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:1234567890123456,
      user_id: 1
      )
      destination.valid?
    end

    it "phone_number: other than int" do
      destination = @user.destinations.build(
      family_name: "山田",
      last_name:"太郎",
      family_name_kana:"ヤマダ",
      last_name_kana:"タロウ",
      zip_code:"1234567",
      prefecture:"北海道",
      municipality:"市区町村",
      address:"",
      apartment_name:"マンション",
      phone_number:"aaaaaa",
      user_id: 1
      )
      destination.valid?
    end
  
  end
end
