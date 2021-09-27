FactoryBot.define do
  factory :user do
    
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = 'a1' + Faker::Internet.password(min_length: 4)
    password {password}
    password_confirmation {password}
    first_name {'清水'}
    last_name {'健多'}
    first_name_kana {'シミズ'}
    last_name_kana {'ケンタ'}
    age {'1989-04-04'}

  end
end