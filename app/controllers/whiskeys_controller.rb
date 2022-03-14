class WhiskeysController < ApplicationController
  before_action :set_whiskey, only: %i[show edit update destroy]

  # GET /whiskeys or /whiskeys.json
  def index
    @whiskeys = Whiskey.all
  end

  # GET /whiskeys/1 or /whiskeys/1.json
  def show; end

  # GET /whiskeys/new
  def new
    @whiskey = Whiskey.new
  end

  # GET /whiskeys/1/edit
  def edit; end

  # POST /whiskeys or /whiskeys.json
  def create
    @whiskey = Whiskey.new(whiskey_params)

    respond_to do |format|
      if @whiskey.save
        format.html do
          redirect_to whiskey_url(@whiskey), notice: 'Whiskey was successfully created.'
        end
        format.json { render :show, status: :created, location: @whiskey }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @whiskey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /whiskeys/1 or /whiskeys/1.json
  def update
    respond_to do |format|
      if @whiskey.update(whiskey_params)
        format.html do
          redirect_to whiskey_url(@whiskey), notice: 'Whiskey was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @whiskey }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @whiskey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whiskeys/1 or /whiskeys/1.json
  def destroy
    @whiskey.destroy

    respond_to do |format|
      format.html { redirect_to whiskeys_url, notice: 'Whiskey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_whiskey
    @whiskey = Whiskey.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def whiskey_params
    # params.fetch(:whiskey, {})
    params.require(:whiskey).permit(:name, :description, :feeling_to_whiskey_with_tongue,
                                    :flavor_strength, :rarity, :reasonable_price,
                                    :drink_way_id, flavor_ids: [])
  end
end
