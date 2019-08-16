require 'faker'

FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    document  { Faker::IDNumber.brazilian_id }
    dt_of_birth { I18n.l(Faker::Date.birthday(min_age: 1, max_age: 65), format: :long) }
  end
end