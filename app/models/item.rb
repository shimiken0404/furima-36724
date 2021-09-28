class Item < ApplicationRecord

  validates :title,                  presence: true
  validates :comment,                presence: true
  validates :item_category_id,       presence: true
  validates :item_show_id,           presence: true
  validates :delivery_pay_id,        presence: true
  validates :delivery_address_id,    presence: true
  validates :delivery_day_id,        presence: true
  validates :pay,                    presence: true
  
  validates :image,                  presence: true

  # has_one    :buy_item
  belongs_to :user
  has_one_attached :image

end

