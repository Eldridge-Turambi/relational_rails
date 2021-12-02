class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end

  def new
  end

  def create
    bar = Bar.new(bar_params)
    bar.save
  end

  def show
    # binding.pry
    @bar = Bar.find(params[:id])
  end
end
