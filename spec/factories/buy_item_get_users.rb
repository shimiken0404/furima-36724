FactoryBot.define do
  factory :buy_item_get_user do

    postal_code {'123-4567'}
    delivery_address_id {3}
    address_city {'静岡'}
    address_number {'青山１−１'}
    address_building {'青山ビル'}
    telephone_number {'09012341234'}
    
    token {"tok_abcdefghijk00000000000000000"}

  end
end
