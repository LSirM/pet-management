class Animal < ApplicationRecord
  include Validators::AnimalTypeValidator
  belongs_to :person
  belongs_to :animal_type

  before_save :validate_by_person_age

  private

    def bird_limitation
      Validators::AnimalTypeValidator.restric_bird_animal_type
    end

    def cat_limitation
      Validators::AnimalTypeValidator.restrict_cat_animal_type
    end

    def validate_by_person_age
      return true if !(self.animal_type_id == bird_limitation&.id && self.person.age < 18)
      throw(:abort)
    end

    def validate_by_person_name
      return true if !(self.animal_type_id == cat_limitation&.id && self.person.name_begins_with?('A'))
      throw(:abort)
    end
end
