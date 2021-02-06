require 'rails_helper'

RSpec.describe 'Manufacturers New Page' do
  describe 'as a visitor' do
    it '' do
      visit '/manufacturers/new'

      fill_in 'name', with: 'MVP Disc Sports'
      fill_in 'founded_in', with: '2010'
      check 'in_business'
      click_button 'Create Manufacturer'

      expect(current_path).to eq('/manufacturers')
      expect(page).to have_content('MVP Disc Sports')
    end
  end
end
