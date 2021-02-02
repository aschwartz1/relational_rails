class ManufacturersController < ApplicationController
  def index
    @manufacturers = ['Example 1', 'Example 2', 'Example 3']
  end

  def new
  end

  def create
    # manufacturer = Manufacturer.new({
    #   name: params[:manufacturer][:name],
    #   founded_in: params[:manufacturer][:founded_in],
    #   in_business: params[:manufacturer][:in_business]
    # })

    # manufacturer.save

    redirect_to '/manufacturers'
  end
end
