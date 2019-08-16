require 'rails_helper'

describe Animal, type: :model do
  describe 'Associations' do
    it { should belong_to(:person) }
    it { should belong_to(:animal_type) }
  end

  context 'AnimalType' do
    describe 'Andorinhas' do
      let(:valid_person){ create(:person, dt_of_birth: I18n.l(20.years.ago, format: :long)) }
      let(:invalid_person){ create(:person, dt_of_birth: I18n.l(8.years.ago, format: :long)) }
      
      let(:animal_type){ create(:animal_type, animal_type: 'Andorinha') }
      let!(:first_animal){ build(:animal, person_id: valid_person.id, animal_type_id: animal_type.id) }
      let!(:second_animal){ build(:animal, person_id: invalid_person.id, animal_type_id: animal_type.id) }

      it 'should succeed if Person is at least 18 years old' do
        first_animal.save
        expect(first_animal).to be_persisted
      end
      
      it 'should fail if Person is under 18 years old' do
        second_animal.save
        expect(second_animal).to_not be_persisted
      end
    end

    describe 'Cat' do
      let(:valid_person){ create(:person, name: 'Pedro') }
      let(:invalid_person){ create(:person, name: 'Alberto') }
      
      let(:animal_type){ create(:animal_type, animal_type: 'Gato') }
      let!(:first_animal){ build(:animal, person_id: valid_person.id, animal_type_id: animal_type.id) }
      let!(:second_animal){ build(:animal, person_id: invalid_person.id, animal_type_id: animal_type.id) }

      it 'should succeed person name does not start with A' do
        first_animal.save
        expect(first_animal).to be_persisted
      end

      it 'should fail if person name start with A' do
        second_animal.save
        expect(second_animal).to_not be_persisted
      end
    end
  end

  context 'Animals Cost' do
    describe 'above 1k' do
      let(:valid_person){ create(:person) }
      let(:invalid_person){ create(:person) }
      let(:animal_type){ create(:animal_type) }

      let!(:first_animal){ create(:animal, person_id: valid_person.id, animal_type_id: animal_type.id) }
      let!(:second_animal){ create(:animal, monthly_cost: 900.0, person_id: invalid_person.id, animal_type_id: animal_type.id) }
      let!(:third_animal){ create(:animal, person_id: invalid_person.id, animal_type_id: animal_type.id) }
      let!(:fourth_animal){ build(:animal, person_id: invalid_person.id, animal_type_id: animal_type.id) }

      it 'should not allow a person to have more animals' do
        fourth_animal.save
        expect(fourth_animal).to_not be_persisted
      end
    end

    describe 'below 1k' do
      let(:valid_person){ create(:person) }
      let(:invalid_person){ create(:person) }
      let(:animal_type){ create(:animal_type) }
      let!(:animal){ create(:animal, person_id: valid_person.id, animal_type_id: animal_type.id) }

      it 'should allow a person to have another animal' do
        animal.save
        expect(animal).to be_persisted
      end
    end
  end
end
