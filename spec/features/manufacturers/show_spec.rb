require 'rails_helper'

RSpec.describe 'Manufacturers Show Page' do
  before :each do
      @innova = Manufacturer.create!(name: 'Innova', founded_in: 1983, in_business: true)
  end

  describe 'as a visitor' do
    it 'shows manufacturer and its attributes' do
      visit "/manufacturers/#{@innova.id}"

      expect(page).to have_content(@innova.id)
      expect(page).to have_content(@innova.name)
      expect(page).to have_content(@innova.founded_in)
      expect(page).to have_content(@innova.in_business)
      expect(page).to have_content(@innova.created_at)
      expect(page).to have_content(@innova.updated_at)
    end

    it 'shows count of manufacturer\'s discs' do
      visit "/manufacturers/#{@innova.id}"

      expect(find_by_id('disc_count').text.to_i).to eq(@innova.disc_count)
    end

    it 'shows a link to that manufactuer\'s discs' do
      visit "/manufacturers/#{@innova.id}"

      expect(page).to have_link('Discs Catalog')
      click_link('Discs Catalog')
      expect(current_path).to eq "/manufacturers/#{@innova.id}/discs"
    end

    it 'shows a link to edit manufacturer' do
      visit "/manufacturers/#{@innova.id}"

      expect(page).to have_link('Update Manufacturer')
      click_link('Update Manufacturer')
      expect(current_path).to eq "/manufacturers/#{@innova.id}/edit"
    end

    it 'shows a link to delete manufacturer' do
      visit "/manufacturers/#{@innova.id}"

      expect(page).to have_button('Delete Manufacturer')
      click_button('Delete Manufacturer')
      expect(current_path).to eq '/manufacturers'
      expect(page).not_to have_content('@innova.namme')
    end

    it 'can navigate home' do
      visit "/manufacturers/#{@innova.id}"

      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq '/'
    end
  end
end
