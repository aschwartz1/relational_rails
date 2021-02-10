class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order_by_creation
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
      in_business: in_business?(params[:manufacturer])
    })

    manufacturer.save

    redirect_to "/manufacturers/#{manufacturer.id}"
  end

  def create
    manufacturer = Manufacturer.new({
      name: params[:manufacturer][:name],
      founded_in: params[:manufacturer][:founded_in],
      in_business: in_business?(params[:manufacturer])
    })

    manufacturer.save

    redirect_to '/manufacturers'
  end

  def destroy
    Manufacturer.destroy(params[:id])

    redirect_to '/manufacturers'
  end

  def discs
    @manufacturer = Manufacturer.find(params[:id])
    if (params[:sort])
      if (params[:filter_max_weight])
        @discs = @manufacturer.discs_above_weight_alpha_sort(params[:filter_max_weight])
      else
        @discs = @manufacturer.discs_alpha_sort
      end
    else
      if (params[:filter_max_weight])
        @discs = @manufacturer.discs_above_weight(params[:filter_max_weight])
      else
        @discs = @manufacturer.discs
      end
    end
  end

  private

  def in_business?(manufacturer_params)
    !manufacturer_params[:in_business].nil?
  end
end
