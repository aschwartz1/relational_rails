require 'rails_helper'

RSpec.describe 'Shops New' do
  before :each do
    @spicy = Shop.create!(name: 'Spicy Pickle', liquor_license: true, revenue: nil)
    @mcalisters = Shop.create!(name: 'McAlisters', liquor_license: false, revenue: 120000)
  end

  describe 'as a visitor' do
    it 'can fill in form and gets redirected' do
      visit '/shops/new'

      fill_in 'name', with: "Torchy's"
      fill_in 'revenue', with: "Content"

      check 'license'

      click_button 'Create Shop'
      expect(current_path).to eq('/shops')
      expect(page).to have_content("Torchy's")
    end
  end
end
