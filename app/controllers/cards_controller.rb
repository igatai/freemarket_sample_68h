class CardsController < ApplicationController
  require "payjp"
  
  # クレジットカードトップ画面
  def index
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  # クレジットカード情報入力画面
  # def new
  #   card = Card.where(user_id: current_user.id)
    # redirect_to action: "show" if card.exists?
  # end

  #payjpとCardのデータベース作成を実施します。
  def pay 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      )
      @card = Card.new(
        user_id: current_user.id, 
        customer_id: customer.id, 
        card_id: customer.default_card
      )

      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end
  
  # クレジットカード情報削除機能
  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end
  
  # クレジットカード詳細情報
  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
