class ShopsController < ApplicationController
  def index
    @shops = ['Shop 1', 'Shop 2', 'Shop 3']
  end

  def new
  end

  def create
    params[:shop][:name]
    params[:shop][:liquor_license]
  end
end
