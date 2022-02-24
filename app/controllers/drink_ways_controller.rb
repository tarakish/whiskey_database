class DrinkWaysController < ApplicationController
  before_action :set_drink_way, only: %i[ show edit update destroy ]

  # GET /drink_ways or /drink_ways.json
  def index
    @drink_ways = DrinkWay.all
  end

  # GET /drink_ways/1 or /drink_ways/1.json
  def show
  end

  # GET /drink_ways/new
  def new
    @drink_way = DrinkWay.new
  end

  # GET /drink_ways/1/edit
  def edit
  end

  # POST /drink_ways or /drink_ways.json
  def create
    @drink_way = DrinkWay.new(drink_way_params)

    respond_to do |format|
      if @drink_way.save
        format.html { redirect_to drink_way_url(@drink_way), notice: "Drink way was successfully created." }
        format.json { render :show, status: :created, location: @drink_way }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @drink_way.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drink_ways/1 or /drink_ways/1.json
  def update
    respond_to do |format|
      if @drink_way.update(drink_way_params)
        format.html { redirect_to drink_way_url(@drink_way), notice: "Drink way was successfully updated." }
        format.json { render :show, status: :ok, location: @drink_way }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @drink_way.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drink_ways/1 or /drink_ways/1.json
  def destroy
    @drink_way.destroy

    respond_to do |format|
      format.html { redirect_to drink_ways_url, notice: "Drink way was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink_way
      @drink_way = DrinkWay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def drink_way_params
      params.require(:drink_way).permit(:name, :how_to_make, :explantion)
    end
end
