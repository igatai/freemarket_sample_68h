class CardsController < ApplicationController
  require 'payjp'
  before_action :set_card

  def index
    @parents = Category.all.order("ancestry ASC").limit(13)
    card = current_user.card
    redirect_to action: "show" if card.exists?
  end

  # クレジットカード情報入力画面
  def new
    if @card
      redirect_to card_path unless @card
    # else
    #   render 'mypages/create_card'
    end
  end

  # 登録画面で入力した情報をDBに保存
  def create
    Payjp.api_key = "sk_test_ee246f31a4f961880a3c2f94"
    if params['payjp-token'].blank?
      # render 'mypages/create_card'
    else
      customer = Payjp::Customer.create( # ここで先ほど生成したトークンを顧客情報と紐付け、PAY.JP管理サイトに送信
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id} # 記述しなくても大丈夫です
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to cards_path
      # else
      #   render 'mypages/create_card'
      end
    end
  end

  def show
    card = current_user.credit_cards.first
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    else
      redirect_to action: "confirmation", id: current_user.id
    end
  end

  # 後ほど削除機能を実装します。
  def delete
    card = current_user.cards.first
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "index", id: current_user.id
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end
  
end
