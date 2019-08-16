require 'rails_helper'

describe Animal, type: :model do
  context 'Associations' do
    it { should belong_to(:person) }
    it { should belong_to(:animal_type) }
  end

  context 'AnimalType' do    
    describe 'Andorinhas' do
      let(:valid_person){ create(:person, dt_birth: 20.years.ago) }
      let(:invalid_person){ create(:person, dt_birth: 8.years.ago) }
      
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
  end
end
