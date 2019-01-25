class ApplicationController < ActionController::Base
  before_action :set_locale

  private
  def set_locale
    # I18n.locale = extract_locale_from_accept_language_header
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # def extract_locale_from_accept_language_header
  #   request.env['HTTP_ACCEPT_LANGUAGE'].split(',').first.include?('zh') ? :"zh-TW" : :en
  # end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

end
