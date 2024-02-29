FactoryBot.define do
  factory :post do
    title { '一日5回ずつ続ける' }
    text { '継続は力なり' }
    category_id { '2' }
    place_id { '2' }
    execution_date { Faker::Date.in_date_period(year: 2024, month: 2) }

    association :user
  end
end
