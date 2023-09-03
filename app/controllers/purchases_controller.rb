class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_form = PurchasesForm.new
  end

  def create
    @purchase_form = PurchasesForm.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchases_form).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id, )
  end

end
