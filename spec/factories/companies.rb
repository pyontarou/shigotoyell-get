FactoryBot.define do
  factory :company do
    company_name{Faker::Name.last_name}
    email{Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    business_content_id {2}
    representative_name {"山田太郎"}
    representative_name_kana {"ヤマダタロウ"}
    prefecture_code {"111-2222"}
    prefectures_id {2}
    city {"大阪市"}
    address {"１−１"}
    phone_number {"0901112222"}
    foundation_date {"2000-01-01"}
  end
end