class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new

  end

  def create
    Venue.create(venue_params)
    redirect_to "/venues"
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    venue = Venue.find(params[:id])
    venue.update(venue_params)
    redirect_to "/venues/#{venue.id}"
  end

  private
    def venue_params
      params.permit(:name, :lights, :capacity)
    end
end
