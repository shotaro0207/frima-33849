class OrderDestination

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipality, :adress, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id
    validates :municipality
    validates :adress
    validates :phone_number, format: { with: /0\d{9,10}/ }
  end

  validates :prefectures_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, adress: adress, building: building, phone_number: phone_number, order_id: order.id)
  end
end