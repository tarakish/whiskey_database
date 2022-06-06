class DrinkWaysController < ApplicationController
  skip_before_action :require_login, only: :index
  before_action :set_drink_way, only: %i[edit update destroy]
  before_action :authorize_drink_way

  def index
    @drink_ways = DrinkWay.eager_load(image_attachment: :blob).order(:id)
  end

  def new
    @drink_way = DrinkWay.new
  end

  def edit; end

  def create
    @drink_way = DrinkWay.new(drink_way_params)
    if @drink_way.save
      redirect_to drink_way_url(@drink_way), notice: 'Drink way was successfully created.'
    else
      render :new
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

  def authorize_drink_way
    authorize DrinkWay, policy_class: ApplicationPolicy
  end

  def drink_way_params
    params.require(:drink_way).permit(
      :name,
      :english_name,
      :how_to_make_url,
      :explanation,
      :image
    )
  end
end
