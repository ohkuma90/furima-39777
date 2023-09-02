class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_form = PurchasesForm.new
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end