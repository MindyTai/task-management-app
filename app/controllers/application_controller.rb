class ApplicationController < ActionController::Base
  before_action :set_locale

  private
  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_accept_language_header
  end

  def extract_locale_from_accept_language_header
    default_languages = ['zh-TW', 'en'] 
    request.env['HTTP_ACCEPT_LANGUAGE'].split(';q=').each do |x| 
      (x.split(',')).values_at(1).each do |y|
        default_languages.each do |z|
          if y==z
            return y
          end
        end
      end
    end

    return 'en'
  end

  def default_url_options(options = {})
    { :locale => I18n.locale }
  end
  
end
