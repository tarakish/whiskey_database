class FlavorsController < ApplicationController
  before_action :set_flavor, only: %i[show edit update destroy]

  # GET /flavors or /flavors.json
  def index
    @flavors = Flavor.all
  end

  # GET /flavors/1 or /flavors/1.json
  def show; end

  # GET /flavors/new
  def new
    @flavor = Flavor.new
  end

  # GET /flavors/1/edit
  def edit; end

  # POST /flavors or /flavors.json
  def create
    @flavor = Flavor.new(flavor_params)

    respond_to do |format|
      if @flavor.save
        format.html { redirect_to flavor_url(@flavor), notice: 'Flavor was successfully created.' }
        format.json { render :show, status: :created, location: @flavor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flavor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flavors/1 or /flavors/1.json
  def update
    respond_to do |format|
      if @flavor.update(flavor_params)
        format.html { redirect_to flavor_url(@flavor), notice: 'Flavor was successfully updated.' }
        format.json { render :show, status: :ok, location: @flavor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flavor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flavors/1 or /flavors/1.json
  def destroy
    @flavor.destroy

    respond_to do |format|
      format.html { redirect_to flavors_url, notice: 'Flavor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_flavor
    @flavor = Flavor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def flavor_params
    params.require(:flavor).permit(:name, :detail, :group)
  end
end
