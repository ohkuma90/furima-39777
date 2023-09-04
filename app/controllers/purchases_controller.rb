class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :item_check, only: :index
  before_action :authenticate_user!, only: :index

  def index
    @purchase_form = PurchasesForm.new
  end

  def create
    @purchase_form = PurchasesForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchases_form).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    item_id = @purchase_form.item_id
    item = Item.find(item_id)
    price = item.price
    Payjp::Charge.create(
      amount: price,
      card: @purchase_form.token,
      currency: 'jpy'
    )
  end

  def item_check
    return unless @item.purchase.present? || current_user == @item.user

    redirect_to root_path
  end
end
