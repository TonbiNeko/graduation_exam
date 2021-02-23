class PlacesController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def index
    @places = Place.sort_desc.page(params[:page]).per(8)
  end

  def show
    @place = Place.find(params[:id])
    @rule = @place.rule
  end

  def search
    @results = @q.result
  end
  private

  def set_q
    @q = Place.ransack(params[:q])
  end
end
