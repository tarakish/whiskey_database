class WhiskeysController < ApplicationController
  before_action :set_whiskey, only: %i[show edit update destroy]

  def index
    @whiskeys = Whiskey.all
  end

  def show; end

  def new
    @whiskey = Whiskey.new
  end

  def edit; end

  def create
    @whiskey = Whiskey.new(whiskey_params)
    if @whiskey.save
      redirect_to whiskey_url(@whiskey), notice: 'Whiskey was successfully created.'
    else
      render :new
    end
  end

  def update
    if @whiskey.update(whiskey_params)
      redirect_to whiskey_url(@whiskey), notice: 'Whiskey was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @whiskey.destroy!
    redirect_to whiskeys_url, notice: 'Whiskey was successfully destroyed.'
  end

  private

  def set_whiskey
    @whiskey = Whiskey.find(params[:id])
  end

  def whiskey_params
    # params.fetch(:whiskey, {})
    params.require(:whiskey).permit(:name, :description, :feeling_to_whiskey_with_tongue, :region,
                                    :flavor_strength, :rarity, :reasonable_price,
                                    :amazon_link, :amazon_image_link, :amazon_impression_link,
                                    :drink_way_id, :snack_id, flavor_ids: [])
  end
end
