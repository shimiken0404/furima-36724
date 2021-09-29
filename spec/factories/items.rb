FactoryBot.define do
  factory :item do

    title {'apple'}
    comment {'すごく使いやすくてお求めやすい'}
    item_category_id {3}
    item_show_id {3}
    delivery_pay_id {3}
    delivery_address_id {3}
    delivery_day_id {3}
    pay {'50000円'}

    association :user


      after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
