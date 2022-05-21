class SnacksController < ApplicationController
  before_action :set_snack, only: %i[show edit update destroy]

  def index
    @snacks = Snack.all.eager_load(image_attachment: :blob)
  end

  def show; end

  def new
    @snack = Snack.new
  end

  def edit; end

  def create
    @snack = Snack.new(snack_params)

    if @snack.save
      redirect_to snack_url(@snack), notice: 'Snack was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @snack.update(snack_params)
      redirect_to snack_url(@snack), notice: 'Snack was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @snack.destroy!
    redirect_to snacks_url, notice: 'Snack was successfully destroyed.'
  end

  private

  def set_snack
    @snack = Snack.find(params[:id])
  end

  def snack_params
    params.require(:snack).permit(:name, :english_name, :description, :image)
  end
end
