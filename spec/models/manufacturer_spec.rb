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

  describe 'instance methods' do
    it '#disc_count' do
      axiom = Manufacturer.create!(name: 'Axiom', founded_in: 2014, in_business: true)
      axiom.discs.create!(name: 'Envy', max_weight: 174, in_production: true)
      axiom.discs.create!(name: 'Proxy', max_weight: 174, in_production: true)

      expect(axiom.disc_count).to eq(2)
    end

    it '#disc_count can be 0' do
      axiom = Manufacturer.create!(name: 'Axiom', founded_in: 2014, in_business: true)

      expect(axiom.disc_count).to eq(0)
    end
  end
end
