class Animal < ApplicationRecord
  belongs_to :person
  belongs_to :animal_type
end
