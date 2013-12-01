class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_default_year  
  helper_method :current_year
  
  def current_year
    @current_year = params[:year] || 2012
  end
  
  private
  def set_default_year
    self.default_url_options[:year] = current_year
  end
end
