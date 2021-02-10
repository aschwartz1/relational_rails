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

    it 'manufacturers are ordered by creation date' do
      # Fudge created_at for one of the records
      @quest.created_at = DateTime.parse('01/01/2021')
      @quest.save

      visit '/manufacturers'

      actual_created_ats = page.all('p.manufacturer-created-at').map(&:text)
      expect(actual_created_ats).to eq([@innova.created_at.to_s, @quest.created_at.to_s].sort)
    end

    it 'shows link to create a new record' do
      visit '/manufacturers'

      expect(page).to have_link('New Manufacturer')
      click_link('New Manufacturer')
      expect(current_path).to eq('/manufacturers/new')
    end

    it 'shows an edit link next to each manufacturer' do
      visit '/manufacturers'

      edit_links = page.all('a.manufacturer-edit')
      expect(edit_links.length).to eq(2)
      edit_links.first.click
      expect(current_path).to match(%r{/manufacturers/\d+/edit})
    end

    it 'can navigate home' do
      visit "/manufacturers"

      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq('/')
    end
  end
end
