class DiscsController < ApplicationController
  def index
    @discs = Disc.all
  end

  def show
    @disc = Disc.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end

  def edit
    @disc = Disc.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.find(params[:manufacturer_id])

    @manufacturer.discs.create!({
      name: params[:disc][:name],
      max_weight: params[:disc][:max_weight],
      in_production: in_production?(params)
    })

    redirect_to "/manufacturers/#{@manufacturer.id}/discs"
  end

  def update
    disc = Disc.find(params[:id])

    disc.update({
      name: params[:disc][:name],
      max_weight: params[:disc][:max_weight],
      in_production: in_production?(params)
    })

    disc.save

    redirect_to "/discs/#{disc.id}"
  end

  def destroy
    Disc.destroy(params[:id])

    redirect_to '/discs'
  end

  private

  def in_production?(params)
    !params[:disc][:in_production].nil?
  end
end
