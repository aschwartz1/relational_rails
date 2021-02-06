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

    it 'can navigate back home' do
      visit "/manufacturers/#{@innova.id}"

      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq('/')
    end

    it 'can navigate to manufacturers index' do
      visit "/manufacturers/#{@innova.id}"

      expect(page).to have_link('Manufacturers')
      click_link('Manufacturers')
      expect(current_path).to eq('/manufacturers')
    end
  end
end
