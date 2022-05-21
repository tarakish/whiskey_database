class FlavorsController < ApplicationController
  before_action :set_flavor, only: %i[show edit update destroy]
  before_action :authorize_flavor

  def index
    @woody_flavors = Flavor.woody
    @winy_flavors = Flavor.winy
    @fruity_flavors = Flavor.fruity
    @floral_flavors = Flavor.floral
    @sereal_flavors = Flavor.sereal
    @smoky_flavors = Flavor.smoky
    # for admin
    @flavors = Flavor.all
  end

  def show; end

  def new
    @flavor = Flavor.new
  end

  def edit; end

  def create
    @flavor = Flavor.new(flavor_params)
    if @flavor.save
      redirect_to flavor_url(@flavor), notice: 'Flavor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @flavor.update(flavor_params)
      redirect_to flavor_url(@flavor), notice: 'Flavor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @flavor.destroy!
    redirect_to flavors_url, notice: 'Flavor was successfully destroyed.'
  end

  private

  def set_flavor
    @flavor = Flavor.find(params[:id])
  end

  def flavor_params
    params.require(:flavor).permit(:name, :detail, :group)
  end

  def authorize_flavor
    authorize Flavor, policy_class: ApplicationPolicy
  end
end
