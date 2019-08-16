require 'faker'

FactoryBot.define do
  factory :animal do
    name { Faker::Games::ElderScrolls.last_name }
    monthly_cost { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    person_id { nil }
    animal_type_id { nil }
  end
end