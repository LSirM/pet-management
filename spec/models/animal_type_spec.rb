require 'rails_helper'

describe AnimalType, type: :model do
  context 'Associations' do
    it { should have_many(:animals) }
  end
end
