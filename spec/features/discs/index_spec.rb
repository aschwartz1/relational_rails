require 'rails_helper'

RSpec.describe 'Discs Index Page' do
  before :each do
      @innova = Manufacturer.create!(name: 'Innova', founded_in: 1983, in_business: true)
      @teebird = @innova.discs.create!(name: 'Teebird', max_weight: 175, in_production: true)
      @wraith = @innova.discs.create!(name: 'Wraith', max_weight: 175, in_production: true)
      @moray = @innova.discs.create!(name: 'Moray', max_weight: 179, in_production: false)
  end

  describe 'as a visitor' do
    it 'shows the name and attributes of each disc' do
      visit '/discs'

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
    end

    it 'only shows in_production discs' do
      visit '/discs'

      expect(page).to_not have_content(@moray.name)
    end

    it 'shows an edit link next to each disc' do
      visit '/discs'

      edit_links = page.all('a.disc-edit')
      expect(edit_links.length).to eq(2)
      edit_links.first.click
      expect(current_path).to match(%r{/discs/\d+/edit})
    end

    it 'shows a delete button next to each disc' do
      visit '/discs'

      delete_buttons = page.all('.disc-delete')
      expect(delete_buttons.length).to eq(2)

      delete_buttons.first.click
      expect(current_path).to eq('/discs')
      delete_buttons = page.all('.disc-delete')
      expect(delete_buttons.length).to eq(1)
    end

    it 'can navigate home' do
      visit "/discs"

      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq('/')
    end
  end
end
