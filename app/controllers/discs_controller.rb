class DiscsController < ApplicationController
  def index
    @discs = Disc.all
  end
end
