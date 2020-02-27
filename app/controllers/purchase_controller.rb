class PurchaseController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @user = User.find(params[:id])
    if user_signed_in? && current_user.id == @product.user_id
      redirect_to "/products/#{@product.id}"
    end
  end

end
