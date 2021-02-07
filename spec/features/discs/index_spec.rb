require 'rails_helper'

RSpec.describe 'Manufacturers Index Page' do
  before :each do
      @innova = Manufacturer.create!(name: 'Innova', founded_in: 1983, in_business: true)
      @teebird = Disc.new(name: 'Teebird', max_weight: 175, in_production: true, manufacturer_id: @innova.id)
      @wraith = Disc.new(name: 'Wraith', max_weight: 175, in_production: true, manufacturer_id: @innova.id)
  end

  describe 'as a visitor' do
    # it 'shows the name of each disc' do
    #   visit '/discs'

    #   expect(page).to have_content(@teebird.name)
    # end

    # it 'shows link to create a new record' do
    #   visit '/manufacturers'

    #   expect(page).to have_link('New Manufacturer')
    #   click_link('New Manufacturer')
    #   expect(current_path).to eq('/manufacturers/new')
    # end

    # it 'can navigate home' do
    #   visit "/manufacturers/#{@innova.id}"

    #   expect(page).to have_link('Home')
    #   click_link('Home')
    #   expect(current_path).to eq('/')
    # end
  end
end
