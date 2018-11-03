require 'rails_helper'
describe Address, '#create' do
  let(:user) { create(:user) }

  it "is valid with a family_name,first_name,family_name_kana,first_name_kana,postal_code,prefecture,city,street_number, building, telephone" do
    address = build(:address, user_id: user.id)
    expect(address).to be_valid
  end

  it "is invalid without a family_name" do
    address = build(:address, family_name: "", user_id: user.id)
    address.valid?
    expect(address.errors[:family_name]).to include("can't be blank")
  end

  it "is invalid without a first_name" do
    address = build(:address, first_name: "", user_id: user.id)
    address.valid?
    expect(address.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a family_name_kana" do
    address = build(:address, family_name_kana: "", user_id: user.id)
    address.valid?
    expect(address.errors[:family_name_kana]).to include("can't be blank")
  end

  it "is invalid without a first_name_kana" do
    address = build(:address, first_name_kana: "", user_id: user.id)
    address.valid?
    expect(address.errors[:first_name_kana]).to include("can't be blank")
  end

  it "is invalid without a postal_code" do
    address = build(:address, postal_code: "", user_id: user.id)
    address.valid?
    expect(address.errors[:postal_code]).to include("can't be blank")
  end

  it "is invalid without a prefecture" do
    address = build(:address, prefecture: "", user_id: user.id)
    address.valid?
    expect(address.errors[:prefecture]).to include("can't be blank")
  end

  it "is invalid without a city" do
    address = build(:address, city: "", user_id: user.id)
    address.valid?
    expect(address.errors[:city]).to include("can't be blank")
  end

  it "is invalid without a street_number" do
    address = build(:address, street_number: "", user_id: user.id)
    address.valid?
    expect(address.errors[:street_number]).to include("can't be blank")
  end

  it "is valid without a building" do
    address = build(:address, building: "", user_id: user.id)
    expect(address).to be_valid
  end

  it "is valid without a telephone" do
    address = build(:address, telephone: "", user_id: user.id)
    expect(address).to be_valid
  end

  it "is invalid with a family_name_kana that is written by kanji" do
    address = build(:address, family_name_kana: "山田", user_id: user.id)
    address.valid?
    expect(address.errors[:family_name_kana]).to include("カナはカタカナで入力して下さい。")
  end

  it "is invalid with a first_name_kana that is written by kanji" do
    address = build(:address, first_name_kana: "山田", user_id: user.id)
    address.valid?
    expect(address.errors[:first_name_kana]).to include("カナはカタカナで入力して下さい。")
  end

  it "is invalid with a family_name_kana that is written by alphabet" do
    address = build(:address, family_name_kana: "", user_id: user.id)
    address.valid?
    expect(address.errors[:family_name_kana]).to include("カナはカタカナで入力して下さい。")
  end

  it "is invalid with a first_name_kana that is written by alphabet" do
    address = build(:address, first_name_kana: "YAMADA", user_id: user.id)
    address.valid?
    expect(address.errors[:first_name_kana]).to include("カナはカタカナで入力して下さい。")
  end

  it "is invalid with a postal_code that is written like not example" do
    address = build(:address, postal_code: "1234-567", user_id: user.id)
    address.valid?
    expect(address.errors[:postal_code]).to include("数字3桁-数字4桁で入力してください")
  end

  it "is invalid with a postal_code that has not hyphen" do
    address = build(:address, postal_code: "1234567", user_id: user.id)
    address.valid?
    expect(address.errors[:postal_code]).to include("数字3桁-数字4桁で入力してください")
  end

  it "is invalid with telephone that has more than 12 characters" do
    address = build(:address, telephone: "123456789123", user_id: user.id)
    address.valid?
    expect(address.errors[:telephone][0]).to include("10桁または11桁の数字を入力してください")
  end

  it "is invalid with telephone that has less than 9 characters" do
    address = build(:address, telephone: "123456789", user_id: user.id)
    address.valid?
    expect(address.errors[:telephone][0]).to include("10桁または11桁の数字を入力してください")
  end

  it "is invalid with telephone that has not number" do
    address = build(:address, telephone: "aiueoaiueoa", user_id: user.id)
    address.valid?
    expect(address.errors[:telephone]).to include("10桁または11桁の数字を入力してください")
  end
end
