class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  

with_options presence: true do
  validates :item_category_id,        numericality: { other_than: 1 , message: "は空白にできません"}
  validates :item_show_id,            numericality: { other_than: 1 , message: "は空白にできません"}
  validates :delivery_pay_id,         numericality: { other_than: 1 , message: "は空白にできません"}
  validates :delivery_address_id,     numericality: { other_than: 0 , message: "は空白にできません"}
  validates :delivery_day_id,         numericality: { other_than: 1 , message: "は空白にできません"}
  validates :title                  
  validates :comment               
  validates :pay,                     inclusion:{in: 300..9999999}, format: { with: /\A[0-9]+\z/ , message: '半角数字のみ使用してください' }
  validates :image
end                  

  belongs_to :item_category
  belongs_to :item_show
  belongs_to :delivery_pay
  belongs_to :delivery_day
  belongs_to :delivery_address

  has_one    :buy_item
  belongs_to :user
  
  has_one_attached :image

end

