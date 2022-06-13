class SnacksController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    @snacks = Snack.order(:id)
  end
end
