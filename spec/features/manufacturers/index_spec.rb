require 'rails_helper'

RSpec.describe 'Manufacturers Index Page' do
  before :each do
      @innova = Manufacturer.create!(name: 'Innova', founded_in: 1983, in_business: true)
      @quest = Manufacturer.create!(name: 'Quest', founded_in: 2006, in_business: false)
  end

  describe 'as a visitor' do
    it 'shows the name of each manufacturer' do
      visit '/manufacturers'

      expect(page).to have_content(@innova.name)
      expect(page).to have_content(@quest.name)
    end

    it 'shows link to create a new record' do
      visit '/manufacturers'

      expect(page).to have_link('New Manufacturer')
      click_link('New Manufacturer')
      expect(current_path).to eq('/manufacturers/new')
    end

    it 'can navigate home' do
      visit "/manufacturers/#{@innova.id}"

      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq('/')
    end
  end
end
