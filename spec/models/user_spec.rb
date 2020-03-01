require 'rails_helper'

# 新規ユーザー登録の単体テスト
describe User do
  describe '#create' do
    it "nickname,email,password,encrypted_password,family_name,last_name,family_name_kana,last_name_kana,birth_year,birth_month,birth_day全てが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが21文字以上では登録できないこと " do
      user = build(:user, nickname: "abcdefghijklmnopqrstu")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "emailが正規表現にマッチしなければ登録できないこと" do
      user = build(:user, email: "aaabbb.ccc")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "password_confirmationとpasswordが一致しなければ登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "family_nameが空では登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "last_nameが空では登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "family_name_kanaが空では登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "family_name_kanaが半角では登録できないこと" do
      user = build(:user, family_name_kana: "ﾀﾅｶ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "family_name_kanaが平仮名では登録できないこと" do
      user = build(:user, family_name_kana: "たなか")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "last_name_kanaが空では登録できないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "last_name_kanaが半角では登録できないこと" do
      user = build(:user, last_name_kana: "ｱﾔ")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end

    it "last_name_kanaが平仮名では登録できないこと" do
      user = build(:user, last_name_kana: "あや")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end

    it "birth_yearが空では登録できないこと" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("は不正な値です")
    end

    it "birth_monthが空では登録できないこと" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("は不正な値です")
    end

    it "birth_dayが空では登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("は不正な値です")
    end
  end
end
