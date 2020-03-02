class PurchaseController < ApplicationController
  before_action :set_product, only: [:show, :pay]
  before_action :set_card, only: [:show, :pay]
  require 'payjp'
  
  def show

    # 登録カード情報
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to cards_path
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end

    # 購入者住所情報
    @user = User.find(current_user.id)

    if user_signed_in? && current_user.id == @product.user_id
      redirect_to "/products/#{@product.id}"
    end
  end

  def pay
    @purchase = Purchase.new(product_id: params[:id], user_id: current_user.id)
    if @purchase.save!
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      amount: @product.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
      redirect_to action: 'done' #完了画面に移動
    end
  end  

  def done
    @purchase = Purchase.new(product_id: params[:id], user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end
end
