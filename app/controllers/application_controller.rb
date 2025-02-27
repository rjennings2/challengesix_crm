class ApplicationController < ActionController::Base
  before_action :set_url_options

  private

  def set_url_options
    ActiveStorage::Current.url_options = { host: request.base_url }
  end
end

