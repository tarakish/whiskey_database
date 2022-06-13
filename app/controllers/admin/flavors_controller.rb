class Admin::FlavorsController < Admin::BaseController
  skip_before_action :require_login, only: :index
  before_action :set_flavor, only: %i[edit update destroy]
  before_action :authorize_flavor

  def index
    @flavors = Flavor.order(:id)
    # @flavors = Flavor.groups.keys.map {|key| {key => Flavor.where(group: key).order(:id)}}
  end

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

  def authorize_flavor
    authorize Flavor, policy_class: ApplicationPolicy
  end

  def flavor_params
    params.require(:flavor).permit(
      :name,
      :detail,
      :group
    )
  end
end
