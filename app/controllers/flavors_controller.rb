class FlavorsController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    @flavors = Flavor.order(:id)
    # @flavors = Flavor.groups.keys.map {|key| {key => Flavor.where(group: key).order(:id)}}
  end
end
