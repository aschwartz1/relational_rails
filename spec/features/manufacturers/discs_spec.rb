require 'rails_helper'

RSpec.describe 'Manufacturer Discs Page' do
  before :each do
      @innova = Manufacturer.create!(name: 'Innova', founded_in: 1983, in_business: true)
      @teebird = @innova.discs.create!(name: 'Teebird', max_weight: 175, in_production: true)
      @wraith = @innova.discs.create!(name: 'Wraith', max_weight: 175, in_production: true)
      @aero = @innova.discs.create!(name: 'Aero', max_weight: 180, in_production: true)

      visit "manufacturers/#{@innova.id}/discs"
  end

  describe 'as a visitor' do
    it 'shows info for each disc they produce' do
      expect(page).to have_content(@teebird.name)
      expect(page).to have_content(@teebird.id)
      expect(page).to have_content(@teebird.max_weight)
      expect(page).to have_content(@teebird.in_production)
      expect(page).to have_content(@teebird.created_at)
      expect(page).to have_content(@teebird.updated_at)

      expect(page).to have_content(@wraith.name)
      expect(page).to have_content(@wraith.id)
      expect(page).to have_content(@wraith.max_weight)
      expect(page).to have_content(@wraith.in_production)
      expect(page).to have_content(@wraith.created_at)
      expect(page).to have_content(@wraith.updated_at)

      expect(page).to have_content(@aero.name)
      expect(page).to have_content(@aero.id)
      expect(page).to have_content(@aero.max_weight)
      expect(page).to have_content(@aero.in_production)
      expect(page).to have_content(@aero.created_at)
      expect(page).to have_content(@aero.updated_at)
    end

    it 'shows form to filter discs by max weight' do
      fill_in 'filter_max_weight', with: 176

      click_button 'Filter'
      expect(current_path).to eq "/manufacturers/#{@innova.id}/discs"
      expect(page).to have_content(@aero.name)
      expect(page).to_not have_content(@wraith.name)
      expect(page).to_not have_content(@teebird.name)
    end

    # TODO: copy above test except w/ 175 (test > vs >= edge case). Test should be the exact same.

    it 'shows link to create a new disc' do
      expect(page).to have_link('Create Disc')
      click_link('Create Disc')
      expect(current_path).to eq "/manufacturers/#{@innova.id}/discs/new"
    end

    it 'can navigate home' do
      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq '/'
    end
  end
end
