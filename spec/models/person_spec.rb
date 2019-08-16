require 'rails_helper'

describe Person, type: :model do
  context 'Associations' do
    it { should have_many(:animals) }
  end

  context 'Creation' do
    let(:person){ build(:person) }
    it 'should have DateTime dt_birth before save' do
      expect(person.dt_birth.class).to eq(ActiveSupport::TimeWithZone)
    end

    it { should be_valid(person) }

    it 'should be persisted' do
      person.save
      expect(person).to be_persisted
    end

  end

  describe 'Age' do
    let(:person){ build(:person)}
    let(:age){ (Date.today.year - person.dt_birth.year) }

    it "should return person's age" do
      expect(person.age).to eq(age)
    end
  end
end
