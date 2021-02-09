require 'rails_helper'

describe Manufacturer, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :discs }
  end

  describe 'class methods' do
    it '.discs_ordered_by_creation' do
      axiom = Manufacturer.create!(name: 'Axiom', founded_in: 2014, in_business: true)
      axiom.discs.create!(name: 'Envy', max_weight: 174, in_production: true)
      axiom.discs.create!(name: 'Proxy', max_weight: 174, in_production: true)

      expected = axiom.discs.order(:created_at)
      actual = axiom.discs_ordered_by_creation

      expect(actual).to eq expected
    end
  end
end
