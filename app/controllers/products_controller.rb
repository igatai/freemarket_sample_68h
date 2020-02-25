class ProductsController < ApplicationController

  def index
    @product = Product.where(category_id: "1").first(3)
    @category = Product.where(category_id: "1").first(3)
    @brand = Product.where(brand_id: "2").first(3)
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  def show
  end

  # require 'payjp'

  # def pay
  #   Payjp.api_key = "sk_test_ee246f31a4f961880a3c2f94"
  #   Payjp::Charge.create(
  #     amount: 809, # 決済する値段
  #     card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
  #     currency: 'jpy'
  #   )
  # end

  private

  def product_params
    params.require(:product).permit(:name, :content, :image_id)
  end  

end
