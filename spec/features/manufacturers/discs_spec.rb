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

    it 'shows an edit link next to each disc' do
      edit_links = page.all('a.disc-edit')
      expect(edit_links.length).to eq(3)
      edit_links.first.click
      expect(current_path).to match(%r{/discs/\d+/edit})
    end

    it 'shows a delete button next to each disc' do
      delete_buttons = page.all('.disc-delete')
      expect(delete_buttons.length).to eq(3)

      delete_buttons.first.click
      expect(current_path).to eq('/discs')
      delete_buttons = page.all('.disc-delete')
      expect(delete_buttons.length).to eq(2)
    end

    it 'shows form to filter discs by max weight' do
      fill_in 'filter_max_weight', with: 176

      click_button 'Filter'
      expect(current_path).to eq "/manufacturers/#{@innova.id}/discs"
      expect(page).to have_content(@aero.name)
      expect(page).to_not have_content(@wraith.name)
      expect(page).to_not have_content(@teebird.name)
    end

    it 'max weight filter operates exclusively' do
      fill_in 'filter_max_weight', with: 180

      click_button 'Filter'
      expect(current_path).to eq("/manufacturers/#{@innova.id}/discs")
      expect(page).to_not have_content(@aero.name)
      expect(page).to_not have_content(@wraith.name)
      expect(page).to_not have_content(@teebird.name)
    end

    it 'shows a link to sort discs alphabetically' do
      expect(page).to have_link('Sort Alphabetically')
      click_link('Sort Alphabetically')
      expect(current_path).to eq("/manufacturers/#{@innova.id}/discs")

      actual_records = page.all('a.disc_link').map(&:text)
      expect(actual_records).to eq(['Aero', 'Teebird', 'Wraith'])
    end

    it 'shows link to create a new disc' do
      expect(page).to have_link('Create Disc')
      click_link('Create Disc')
      expect(current_path).to eq("/manufacturers/#{@innova.id}/discs/new")
    end

    it 'can navigate home' do
      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq('/')
    end
  end
end
