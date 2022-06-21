class FlavorsController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    @flavors = Flavor.order(:id)
    # @flavors = Flavor.categories.keys.map {|key| {key => Flavor.where(category: key).order(:id)}}
  end
end
