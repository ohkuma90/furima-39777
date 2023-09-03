class PurchasesForm
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :purchase_id
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipalities, presence: true
  validates :street_address, presence: true
  validates :telephone_number, presence: true, numericality: { only_integer: true, message: "is invalid. Input only number" }, length: { minimum: 10, maximum: 11, }

  def save
    binding.pry
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end