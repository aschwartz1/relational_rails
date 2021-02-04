class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
  end

  def create
    shop = Shop.new({
      name: params[:shop][:name],
      liquor_license: params[:shop][:liquor_license]
      })

    shop.save

    redirect_to '/shops'
  end

  def show
    @shop = Shop.find(params[:id])
  end
end