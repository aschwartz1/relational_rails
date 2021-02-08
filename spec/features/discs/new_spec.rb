require 'rails_helper'

RSpec.describe 'Discs New Page' do
  describe 'as a visitor' do
    it 'can create a disc' do
      @innova = Manufacturer.create!(name: 'Innova', founded_in: 1983, in_business: true)

      visit "/manufacturers/#{@innova.id}/discs/new"

      fill_in 'form_name', with: 'Aero'
      fill_in 'form_max_weight', with: 180
      uncheck 'form_in_production'

      click_button 'Create Disc'
      expect(current_path).to eq "/manufacturers/#{@innova.id}/discs"
      expect(page).to have_content('Aero')
    end
  end
end
