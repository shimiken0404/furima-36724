class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  
     validates :item_category_id,       presence: true
     validates :item_show_id,           presence: true
     validates :delivery_pay_id,        presence: true
     validates :delivery_address_id,    presence: true
     validates :delivery_day_id,        presence: true
  
    validates :item_category_id,    numericality: { other_than: 1 , message: "can't be blank"}
    validates :item_show_id,        numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_pay_id,     numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_address_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :delivery_day_id,     numericality: { other_than: 1 , message: "can't be blank"}
  
  validates :title,                  presence: true
  validates :comment,                presence: true
  validates :pay,                    presence: true
  validates :image,                  presence: true


  belongs_to :item_category
  belongs_to :item_show
  belongs_to :delivery_pay
  belongs_to :delivery_day
  belongs_to :delivery_address

  # has_one    :buy_item
  belongs_to :user
  has_one_attached :image

end

