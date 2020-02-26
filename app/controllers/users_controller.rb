class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @parents = Category.all.order("ancestry ASC").limit(13)
  end
end