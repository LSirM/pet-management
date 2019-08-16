class Animal < ApplicationRecord
  include Validators::AnimalTypeValidator
  belongs_to :person
  belongs_to :animal_type

  before_save :validate_by_person_age

  private

    def bird_limitation
      Validators::AnimalTypeValidator.restric_bird_animal_type
    end

    def validate_by_person_age
      !(self.animal_type_id == bird_limitation&.id && self.person.age < 18)
    end
end
