require 'rails_helper'

describe Animal, type: :model do
  context 'Associations' do
    it { should belong_to(:person) }
    it { should belong_to(:animal_type) }
  end
end
