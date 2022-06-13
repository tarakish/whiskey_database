class SnacksController < ApplicationController
  skip_before_action :require_login, only: :index
  before_action :authorize_snack

  def index
    @snacks = Snack.order(:id)
  end

  private

  def authorize_snack
    authorize Snack, policy_class: ApplicationPolicy
  end
end
