class DrinkWaysController < ApplicationController
  skip_before_action :require_login, only: :index
  before_action :authorize_drink_way

  def index
    @drink_ways = DrinkWay.order(:id)
  end

  private

  def authorize_drink_way
    authorize DrinkWay, policy_class: ApplicationPolicy
  end

end
