class BuyItemGetUser
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_address_id, :address_city, :address_number, :address_building, :telephone_number, :token

  with_options presence: true do
    validates :postal_code,         format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはーをつけてください"}
    validates :delivery_address_id, numericality: { other_than: 0 , message: "を選んでください"}
    validates :address_city
    validates :address_number
    validates :telephone_number,    format: {with: /\A[0-9]+\z/, message: "電話番号は、10桁以上11桁以内の半角数値のみ保存可能"},length: {minimum:10, maximum:11}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save 
    buy_item = BuyItem.create(item_id: item_id, user_id: user_id)
    GetUser.create(postal_code: postal_code, delivery_address_id: delivery_address_id, address_city: address_city, address_number: address_number, telephone_number: telephone_number, buy_item_id: buy_item.id)
  end
end
