require 'rails_helper'

describe Manufacturer, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :discs }
  end
end
