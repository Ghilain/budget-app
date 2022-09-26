require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    user = User.create(name: 'Lynette', email: 'lynette@test.come', password: '1234567')
    Entity.new(author: user, name: 'skating', amount: 5)
  end

  before { subject.save }

  describe 'validations' do
    it 'not valid without name' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'valid if amount isnt greater than zero' do
      subject.amount = 0
      expect(subject).to be_valid
    end
  end
end
