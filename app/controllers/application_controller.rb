class ApplicationController < ActionController::Base
  include Banken
  protect_from_forgery
  add_flash_types :success, :info, :warning, :danger
end
