FactoryBot.define do
  factory :user do
    nickname{Faker::Name.last_name}
    email{Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    prefecture_code {"111-2222"}
    prefectures_id {2}
    city {"大阪市"}
    address {"１−１"}
    phone_number {"0901111111"}
    birth_day {"2000-01-01"}
  end
end