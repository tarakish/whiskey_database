class DrinkWaysController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    @drink_ways = DrinkWay.order(:id)
  end
end
