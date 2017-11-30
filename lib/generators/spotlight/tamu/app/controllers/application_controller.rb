class ApplicationController < ActionController::Base
  helper Openseadragon::OpenseadragonHelper
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  include Spotlight::Controller

  before_action :set_paper_trail_whodunnit

  layout 'blacklight'

  protect_from_forgery with: :null_session
end
