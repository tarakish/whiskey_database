class DrinkWaysController < ApplicationController
  before_action :set_drink_way, only: %i[show edit update destroy]

  def index
    @drink_ways = DrinkWay.all
  end

  def show; end

  def new
    @drink_way = DrinkWay.new
  end

  def edit; end

  def create
    @drink_way = DrinkWay.new(drink_way_params)
    if @drink_way.save
      redirect_to drink_way_url(@drink_way), notice: 'Drink way was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @drink_way.update(drink_way_params)
      redirect_to drink_way_url(@drink_way), notice: 'Drink way was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @drink_way.destroy!
    redirect_to drink_ways_url, notice: 'Drink way was successfully destroyed.'
  end

  private
  def set_drink_way
    @drink_way = DrinkWay.find(params[:id])
  end

  def drink_way_params
    params.require(:drink_way).permit(:name, :how_to_make, :explanation)
  end
end
