require 'rails_helper'

RSpec.describe 'Shops Index' do
  before :each do
    @spicy = Shop.create!(name: 'Spicy Pickle', liquor_license: true, revenue: nil)
    @mcalisters = Shop.create!(name: 'McAlisters', liquor_license: false, revenue: 120000)
  end

  describe 'as a visitor' do
    it 'shows shops' do
      visit '/shops'

      expect(page).to have_content(@spicy.name)
      expect(page).to have_content(@mcalisters.name)
    end

    it 'has a link to create new shop' do
      visit '/shops'

      expect(page).to have_link("New Shop")

      click_link "New Shop"
      expect(current_path).to eq('/shops/new')
    end
  end

end
