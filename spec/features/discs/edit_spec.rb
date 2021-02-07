require 'rails_helper'

RSpec.describe 'Discs Edit Page' do
  describe 'as a visitor' do
    before :each do
      @innova = Manufacturer.create!(name: 'Innova', founded_in: 1983, in_business: true)
      @teebird = @innova.discs.create!(name: 'Teebird', max_weight: 175, in_production: true)

      visit "/discs/#{@teebird.id}/edit"
    end

    it 'loads with saved data' do
      expect(find_field('form_name').value).to eq @teebird.name
      expect(find_field('form_max_weight').value.to_i).to eq @teebird.max_weight
      expect(page).to have_field('form_in_production', checked: @teebird.in_production)
    end

    it 'allows user to change all attributes' do
      fill_in 'form_name', with: 'Aero'
      fill_in 'form_max_weight', with: 180
      uncheck 'form_in_production'

      click_button 'Update Disc'
      expect(current_path).to eq "/discs/#{@teebird.id}"
      expect(page).to have_content('Aero')
    end
  end
end
