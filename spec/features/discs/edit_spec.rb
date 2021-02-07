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
  end
end
    # it 'loads with saved data' do
    #   expect(find_field('form_name').value).to eq @innova.name
    #   expect(find_field('form_founded_in').value.to_i).to eq @innova.founded_in
    #   expect(page).to have_field('form_in_business', checked: true)
    # end

    # it 'allows user to change all attributes' do
    #   fill_in 'form_name', with: 'Quest AT'
    #   fill_in 'form_founded_in', with: '2003'
    #   uncheck 'form_in_business'

    #   click_button 'Update Manufacturer'
    #   expect(current_path).to eq("/manufacturers/#{@innova.id}")
    #   expect(page).to have_content('Quest AT')
    # end
