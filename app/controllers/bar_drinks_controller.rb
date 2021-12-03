class BarDrinksController < ApplicationController
  def index
    @bar = Bar.find(params[:id])
  end
end
