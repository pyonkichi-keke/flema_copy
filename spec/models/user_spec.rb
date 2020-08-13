require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do

    it "保存できるかテスト" do
    user = build(:user)
    expect(user).to be_valid
    end

    it "ニックネームが空だと登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "名前が空では登録できないこと" do
      expect(build(:user, first_name: nil)).to_not be_valid
    end
  
    it "苗字が空では登録できないこと" do
      expect(build(:user, last_name: nil)).to_not be_valid
    end
  
    it "本名が全角以外では登録できないこと" do
      expect(build(:user, first_name: "aaaaa")).to_not be_valid
    end
  
    it "名前のふりがなが空では登録できないこと" do
      expect(build(:user, first_name_kana: nil)).to_not be_valid
    end
  
    it "苗字のふりがなが空では登録できないこと" do
      expect(build(:user, last_name_kana: nil)).to_not be_valid
    end
  
    it "名前のふりがなが全角以外では登録できないこと" do
      expect(build(:user, first_name_kana: "aaaaa")).to_not be_valid
    end
  
    it "苗字のふりがなが全角以外では登録できないこと" do
      expect(build(:user, last_name_kana: "aaaaa")).to_not be_valid
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

     it "重複したemailが存在する場合登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "emailは@が含まれていないと保存できない" do
      expect(build(:user, email: "aaaaaa.com")).to_not be_valid
    end

    it "passwordが空では登録できないこと" do
      expect(build(:user, password: nil)).to_not be_valid
    end

    it "passwordは７文字以上" do
      expect(build(:user, password: "aaaaaa")).to_not be_valid
    end
    
    it "passwordは確認用を含めて２回入力すること" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "birthdayが空では登録できないこと" do
      expect(build(:user, birthday: nil)).to_not be_valid
    end
  
    it "birthdayが8桁以外は登録できないこと" do
      expect(build(:user, birthday: "111")).to_not be_valid
    end

end

