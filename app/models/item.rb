class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  after_initialize :default_values

  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :brand
  belongs_to :category
  # has_many :comments
  # has_one :trade_history
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :trade_status
  belongs_to_active_hash :item_status
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :shipping_charger
  belongs_to_active_hash :shipping_method

  private
  def default_values
    self.brand_id = 19 if self.brand_id.nil?
  end
end
