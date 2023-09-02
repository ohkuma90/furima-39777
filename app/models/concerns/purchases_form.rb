class PurchaseForm
  include ActiveModel::Model

  attr_accessor :item, :user, :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :purchase
  validates :post_code, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipalities, presence: true
  validates :street_address, presence: true
  validates :building_name, presence: true
  validates :telephone_number, presence: true

  def save
    purchase = Purchase.create(item_id: @item.id, user_id: current_user.id)
    Address.create(:post_code post_code, :prefecture_id prefecture_id, :municipalities municipalities, :street_address street_address, :building_name building_name, :telephone_number telephone_number, purchase_id: purchase.id)
  end
end