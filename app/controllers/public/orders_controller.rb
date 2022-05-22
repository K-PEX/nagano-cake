class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.all
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to public_orders_thanks_path
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.payment_method = params[:order][:payment_method]
    total = 0
    @cart_items.each do |cart_item|
     total += cart_item.subtotal
    end
    @total_payment = total
    @order.shipping_cost = 800
    address_select = params[:order][:address_select]
    if address_select == "0"
      @address = current_customer.address
      @postal_code = current_customer.postal_code
      @name = current_customer.full_name
    elsif address_select == "1"
      delivery = Delivery.find(params[:order][:delivery_id])
      @address = delivery.delivery_address
      @postal_code = delivery.delivery_postal_code
      @name = delivery.delivery_name
    elsif address_select == "2"
      @address = params[:order][:address]
      @postal_code = params[:order][:postal_code]
      @name = params[:order][:name]
    end
  end

  def thanks
  end


  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :address_select)
  end

  def delivery_params
    params.require(:delivery).permit(:customer_id, :delivery_postal_code, :delivery_address, :delivery_name)
  end



end
