class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @orders = current_customer.orders.all
  end
  
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = current_customer.addresses
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_thanks_path
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end
  
  def confirm
    @cart_products = current_customer.cart_products
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment_method = params[:order][:payment]
    @total_payment = current_customer.cart_items.cart_items_total_payment(@cart_products)
    @order.shipping_cost = 800
  end
  
  def thanks
  end


  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment)
  end

  def addresses_params
    params.require(:addresses).permit(:customer_id, :postal_code, :address, :name)
  end
  
  
  
end
