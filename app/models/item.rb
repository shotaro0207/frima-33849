class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefectures
  belongs_to :days
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefectures_id
    validates :days_id
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefectures_id
    validates :days_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
