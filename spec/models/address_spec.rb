require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Address do
  
  it "first_nameが空では登録できないこと" do
    expect(build(:address, first_name: nil)).to_not be_valid
  end

  it "last_nameが空では登録できないこと" do
    expect(build(:address, last_name: nil)).to_not be_valid
  end

  it "first_nameが全角以外では登録できないこと" do
    expect(build(:address, first_name: "aaaaa")).to_not be_valid
  end

  it "first_name_kanaが空では登録できないこと" do
    expect(build(:address, first_name_kana: nil)).to_not be_valid
  end

  it "last_name_kanaが空では登録できないこと" do
    expect(build(:address, last_name_kana: nil)).to_not be_valid
  end

  it "first_name_kanaが全角以外では登録できないこと" do
    expect(build(:address, first_name_kana: "aaaaa")).to_not be_valid
  end

  it "last_name_kanaが全角以外では登録できないこと" do
    expect(build(:address, last_name_kana: "aaaaa")).to_not be_valid
  end

  it "postal_codeが空では登録できないこと" do
    expect(build(:address, postal_code: nil)).to_not be_valid
  end

  it "prefectureが空では登録できないこと" do
    expect(build(:address, prefecture: nil)).to_not be_valid
  end

  it "cityが空では登録できないこと" do
    expect(build(:address, city: nil)).to_not be_valid
  end

  it "addressが空では登録できないこと" do
    expect(build(:address, address: nil)).to_not be_valid
  end

  it "apartmentが空でも登録できること" do
    expect(build(:address, apartment: nil)).to be_valid
  end

  it "telが空でも登録できること" do
    expect(build(:address, tel: nil)).to be_valid
  end

  it "telが10桁か11桁以外は登録できないこと" do
    expect(build(:address, tel: "0000000")).to_not be_valid
  end
end