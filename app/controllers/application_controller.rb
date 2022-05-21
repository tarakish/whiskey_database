class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery
  add_flash_types :success, :info, :warning, :danger
end
