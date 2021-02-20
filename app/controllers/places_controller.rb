class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = current_place
    @rule = @place.rule
  end
end
