class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new

  end

  def create
    venue = Venue.create(venue_params)
  end

  def show
    @venue = Venue.find(params[:id])
  end
end
