require 'rails_helper'

RSpec.describe 'Shops Edit,' do
  describe 'as a visitor' do
    before :each do
      @spicy = Shop.create!(name: 'Spicy Pickle', liquor_license: true, revenue: nil)
    end

    describe 'when I visit the shops id page' do
      it 'autofills shop info' do
        visit "/shops/#{@spicy.id}/edit"

        expect(find_field('name').value).to eq("Spicy Pickle")
        expect(find_field('revenue').value).to eq(nil)
        expect(page).to have_field('license', checked: true)
      end

      it 'I can edit form' do
        visit "/shops/#{@spicy.id}/edit"

        fill_in 'name', with: "Spicy"
        fill_in 'revenue', with: "$40000"

        uncheck 'license'

        click_button 'Update Shop'
        expect(current_path).to eq("/shops/#{@spicy.id}")
      end
    end
  end
end
