require 'rails_helper'

RSpec.describe 'Shops Edit,' do
  describe 'as a visitor' do
    describe 'when I visit the shops id page' do
      it 'can edit a shop with a form' do
        @spicy = Shop.create!(name: 'Spicy Pickle', liquor_license: true, revenue: nil)

        visit "/shops/#{@spicy.id}/edit"

        expect(find_field('name').value).to eq("Spicy Pickle")
      end
    end
  end
end
