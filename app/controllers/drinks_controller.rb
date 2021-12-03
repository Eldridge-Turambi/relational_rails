class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def new

  end

  def create
      drink = Drink.new(drink_params)
  end
end
