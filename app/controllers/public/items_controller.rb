class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @quantity = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def top
   @items = Item.order("RANDOM()").limit(4)
  end
end
