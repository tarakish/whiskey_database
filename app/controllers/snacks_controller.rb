class SnacksController < ApplicationController
  skip_before_action :require_login, only: :index
  before_action :set_snack, only: %i[show edit update destroy]
  before_action :authorize_snack

  def index
    @snacks = Snack.eager_load(image_attachment: :blob).order(:id)
  end

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

  def authorize_snack
    authorize Snack, policy_class: ApplicationPolicy
  end

  def snack_params
    params.require(:snack).permit(
      :name,
      :english_name,
      :description,
      :image
    )
  end
end
