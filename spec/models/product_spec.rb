require 'rails_helper'

  describe Product do
    describe '#create' do

    #1 全部入力があれば、ログインできる。
    it "is valid with a prefecture_id, category_id, price,
        delibery_method, payment,status, condition, content, name, user_id" do
      user = FactoryBot.create(:user)
      brand = FactoryBot.create(:brand)
      prefecture = Prefecture.create(name: "高知県")
      category = FactoryBot.create(:category)
   
      product = build(:product, user_id: user.id,brand_id: brand.id, prefecture_id: prefecture.id,category_id: category.id)
     

      expect(product).to be_valid
    end

    

    #3 prefecture_idが空の場合不可
    it "is invalid without a prefecture_id" do
      product = build(:product, prefecture_id: "")
      product.valid?
      expect(product.errors[:prefecture_id]).to include("can't be blank")
    end

    #4 category_id,が空の場合不可
    it "is invalid without a category_id," do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id,]).to include("can't be blank")
    end

    #5 priceが空の場合不可
    it "is invalid without a price" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    #6 delivery_methodが空の場合不可
    it "is invalid without a delivery_method" do
      product = build(:product, delivery_method: "")
      product.valid?
      expect(product.errors[:delivery_method]).to include("can't be blank")
    end

    #7 paymentが空の場合不可
    it "is invalid without a payment" do
      product = build(:product, payment: "")
      product.valid?
      expect(product.errors[:payment]).to include("can't be blank")
    end

    #8 statusが空の場合不可
    it "is invalid without a status" do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end

    #9 conditionが空の場合不可
    it "is invalid without a condition" do
      product = build(:product, condition: "")
      product.valid?
      expect(product.errors[:condition]).to include("can't be blank")
    end

    #10 contentが空の場合不可
    it "is invalid without a content" do
      product = build(:product, content: "")
      product.valid?
      expect(product.errors[:content]).to include("can't be blank")
    end

    #11 nameが空の場合不可
    it "is invalid without a content" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end


  end
end
