class Public::DeliveryController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @deliveries = Delivery.all
    @delivery.save
    redirect_to public_delivery_index_path
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to public_delivery_index_path
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to public_delivery_index_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:delivery_postal_code, :delivery_address, :delivery_name)
  end
end
