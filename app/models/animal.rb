class Animal < ApplicationRecord
  include Validators::AnimalTypeValidator
  belongs_to :person
  belongs_to :animal_type

  before_save :validates_animal_type

  private

    def validates_animal_type
      return true if !(self.animal_type_id == animal_type_limitation&.id && self.person.age < 18)
      throw(:abort)
    end

    def animal_type_limitation
      Validators::AnimalTypeValidator.restric_bird_animal_type
    end
end
