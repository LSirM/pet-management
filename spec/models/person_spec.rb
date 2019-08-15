require 'rails_helper'

describe Person, type: :model do
  context 'Associations' do
    it { should have_many(:animals) }
  end
end
