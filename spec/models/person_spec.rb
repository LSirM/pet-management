require 'rails_helper'

describe Person, type: :model do
  context 'Associations' do
    it { should have_many(:animals) }
  end

  context 'Creation' do
    let(:dt_of_birth){ Faker::Date.birthday(min_age: 1, max_age: 65) }
    let(:brazilian_dt_of_birth){ I18n.l(dt_of_birth, format: :long) }
    let(:person){ build(:person) }
    
    it 'should have DateTime dt_birth before save' do
      expect(person.convert_to_date(brazilian_dt_of_birth).class).to eq(DateTime)
    end

    it { should be_valid(person) }

    it 'should be persisted' do
      person.convert_to_date(brazilian_dt_of_birth)
      person.save
      expect(person).to be_persisted
    end

  end
end
