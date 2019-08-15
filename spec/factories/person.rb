require 'faker'

FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    document  { Faker::IDNumber.brazilian_id }
    dt_birth { Faker::Date.birthday(min_age: 1, max_age: 65) }
  end
end