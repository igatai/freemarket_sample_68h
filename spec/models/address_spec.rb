require 'rails_helper'

  describe Address do
    describe '#create' do

    #1 全部入力があれば、ログインできる。
    it "is valid with a zipcode, city, address, building, prefecture_id" do
      address = build(:address)
      expect(address).to be_valid
    end
    #2 zipcodeが空の場合不可
    it "is invalid without zipcode" do
      address = build(:address, zipcode: "")
      address.valid?
      expect(address.errors[:zipcode]).to include("can't be blank")
    end
    #3 cityが空の場合不可
    it "is invalid without city" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end
    #4 addressが空の場合不可
    it "is invalid without address" do
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("can't be blank")
    end
    #6 prefecture_idが空の場合不可
    it "is invalid without zipcode" do
      address = build(:address, prefecture_id: "")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end
    #7 zipcodeが６文字の場合不可
    it "must be 7 charactor with zipcode" do
      address = create(:address)
      address = build(:address, zipcode: "111111")
      address.valid?
      expect(address.errors[:zipcode])
    end
    #8 cityが半角の場合不可
    it "is invalid without zipcode" do
      address = create(:address)
      address = build(:address, city: "hankaku")
      address.valid?
      expect(address.errors[:city])
    end

  end
end
