require 'rails_helper'

describe Manufacturer, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :discs }
  end

  describe 'class methods' do
    it '.all_ordered_by_creation' do
      axiom = Manufacturer.create!(
          name: 'Axiom',
          founded_in: 2014,
          in_business: true,
          created_at: DateTime.parse('01/01/2020'))

      innova = Manufacturer.create!(
        name: 'Innova',
        founded_in: 1983,
        in_business: true,
        created_at: DateTime.parse('12/12/2019'))

      expected = Manufacturer.order(:created_at)

      expect(Manufacturer.order_by_creation).to eq(expected)
    end
  end
end
