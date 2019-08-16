module Validators
  module AnimalTypeValidator

    def self.restric_bird_animal_type
      animal_type = AnimalType.find_by(animal_type: 'Andorinha')
      animal_type
    end
  end
end