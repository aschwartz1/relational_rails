class DiscsController < ApplicationController
  def index
    @discs = Disc.all
  end

  def show
    @disc = Disc.find(params[:id])
  end

  def edit
    @disc = Disc.find(params[:id])
  end
end
