require 'faker'

FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    document  { Faker::IDNumber.brazilian_id }
  end
end