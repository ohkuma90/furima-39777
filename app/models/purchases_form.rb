class PurchasesForm
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :municipalities, :street_address, :building_name,
                :telephone_number, :purchase_id, :token

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :street_address
    validates :telephone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' },
                               length: { minimum: 10, maximum: 11 }
  end

  def save
    purchase = Purchase.create(item_id:, user_id:)
    Address.create(post_code:, prefecture_id:, municipalities:,
                   street_address:, building_name:, telephone_number:, purchase_id: purchase.id)
  end
end
