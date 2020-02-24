class CreditController < ApplicationController

  def index
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def new
  end
end
