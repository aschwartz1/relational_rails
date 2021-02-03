class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
  end

  def update
    manufacturer = Manufacturer.find(params[:id])

    manufacturer.update({
      name: params[:manufacturer][:name],
      founded_in: params[:manufacturer][:founded_in],
      in_business: params[:manufacturer][:in_business]
    })

    manufacturer.save

    redirect_to "/manufacturers/#{manufacturer.id}"
  end

  def create
    manufacturer = Manufacturer.new({
      name: params[:manufacturer][:name],
      founded_in: params[:manufacturer][:founded_in],
      in_business: params[:manufacturer][:in_business]
    })

    manufacturer.save

    redirect_to '/manufacturers'
  end

  def destroy
    Manufacturer.destroy(params[:id])

    redirect_to '/manufacturers'
  end
end
