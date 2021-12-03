class PerformersController < ApplicationController

  def index
    @performers = Performer.all
  end

  def new
  end

  def create
    performer = Performer.create!(performer_params)
  end

  def show
    @performer = Performer.find(params[:id])
  end
end
