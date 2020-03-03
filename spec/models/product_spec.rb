require 'rails_helper'

  describe Product do
    describe '#create' do

    #1 全部入力があれば、ログインできる。
    it "is valid with a prefecture_id, category_id, price,
        delibery_method_id, payment_id,status_id, condition_id, content, name, user_id" do
      user = create(:user)
      brand = create(:brand)
      prefecture = Prefecture.create(name: "高知県")
      delivery_method = DeliveryMethod.create(id: "1")
      condition = Condition.create(id: "1")
      status = Status.create(id: "1")
      payment = Payment.create(id: "1")
      delivery_date = DeriveryDate.create(id: "1")
      
      
      # category = create(:category)
      # category = FactoryBot.create(:category)
   
      product = build(
        product,
        user_id: user.id,
        brand_id: brand.id,
        prefecture_id: prefecture.id,
        condition_id: condition.id,
        status_id: status.id,
        payment_id: payment.id,
        delivery_date_id: deliveryDate.id,
        delivery_method_id: deliveryMethod.id
        # category_id: category.id
      )
     

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
      product = build(:product, delivery_method_id: "")
      product.valid?
      expect(product.errors[:delivery_method_id]).to include("can't be blank")
    end

    #7 paymentが空の場合不可
    it "is invalid without a payment" do
      product = build(:product, payment_id: "")
      product.valid?
      expect(product.errors[:payment_id]).to include("can't be blank")
    end

    #8 statusが空の場合不可
    it "is invalid without a status" do
      product = build(:product, status_id: "")
      product.valid?
      expect(product.errors[:status_id]).to include("can't be blank")
    end

    #9 conditionが空の場合不可
    it "is invalid without a condition" do
      product = build(:product, condition_id: "")
      product.valid?
      expect(product.errors[:condition_id]).to include("can't be blank")
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
