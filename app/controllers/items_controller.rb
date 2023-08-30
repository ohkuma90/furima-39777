class ItemsController < ApplicationController
  
  def index
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)

end
