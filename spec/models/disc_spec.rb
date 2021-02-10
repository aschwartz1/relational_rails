require 'rails_helper'

describe Disc, type: :model do
  describe 'relationships' do
    it { should belong_to :manufacturer }
  end

  describe 'class methods' do
    it '.in_production_by_manufacturer' do
      axiom = Manufacturer.create!(name: 'Axiom', founded_in: 2014, in_business: true)
      envy = axiom.discs.create!(name: 'Envy', max_weight: 174, in_production: true)
      proxy = axiom.discs.create!(name: 'Proxy', max_weight: 174, in_production: true)
      alias_ = axiom.discs.create!(name: 'Alias', max_weight: 178, in_production: false)

      expect(Disc.in_production_by_manufacturer(axiom.id)).to eq([envy, proxy])
    end
  end
end
