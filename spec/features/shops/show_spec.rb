require 'rails_helper'

RSpec.describe 'Shops show' do
  before :each do
    @spicy = Shop.create!(name: 'Spicy Pickle', liquor_license: true, revenue: nil)
  end

  describe 'as a visitor' do
    it 'shows each shop and its attributes' do
      visit "/shops/#{@spicy.id}"

      expect(page).to have_content(@spicy.name)
      expect(page).to have_content(@spicy.id)
      expect(page).to have_content("This business has a liquor license")
      expect(page).to have_content(@spicy.revenue)
      expect(page).to have_content(@spicy.created_at)
      expect(page).to have_content(@spicy.updated_at)
    end

    it 'shows link to update shop' do
      visit "/shops/#{@spicy.id}"

      expect(page).to have_link("Update Shop")
      click_link "Update Shop"
      expect(current_path).to eq("/shops/#{@spicy.id}/edit")
    end
  end
end
