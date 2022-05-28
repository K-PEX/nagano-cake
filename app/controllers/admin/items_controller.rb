class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)

  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :show
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
     @genres = Genre.all
     @item = Item.find(params[:id])
   if @item.update(item_params)
     redirect_to admin_item_path
   else
      render :edit
   end
  end

   private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :image, :is_active)
  end


end
