class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  add_flash_types :error, :notice
end
