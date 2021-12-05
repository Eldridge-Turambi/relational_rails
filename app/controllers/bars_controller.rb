class BarsController < ApplicationController
  def index
    @bars = Bar.all.order(created_at: :desc)
  end

  def new
  end

  def create
    # bar = Bar.new(bar_params)
    # bar.save
    # ^^^this is the same
    bar = Bar.create(bar_params)
  end

  def show
    @bar = Bar.find(params[:id])
  end
end
