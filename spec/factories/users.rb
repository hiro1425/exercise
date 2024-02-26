FactoryBot.define do
  factory :user do
    nickname              {'test02'}
    email                 {Faker::Internet.email}
    password              {'f7' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end