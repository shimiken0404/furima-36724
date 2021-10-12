class BuyItemGetUser
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :delivery_address_id, :address_city, :address_number, :address_building, :telephone_number, :token

  # get_user
  with_options presence: true do
    validates :postal_code,         format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_address_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :address_city
    validates :address_number
    validates :telephone_number,    format: {with: /\A[0-9]+\z/, message: "電話番号は、10桁以上11桁以内の半角数値のみ保存可能"},length: {minimum:10, maximum:11}
    validates :token
  end

  def save #buy_item?
    buy_item = BuyItem.create(item_id: item, user_id: user)
    GetUser.create(postal_code: postal_code, delivery_address_id: delivery_address_id, address_city: address_city, address_number: address_number, telephone_number: telephone_number, buy_item_id: buy_item.id)
  end
end
