class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => "aod", :password => "inprogress"
  protect_from_forgery
  before_filter :set_default_year  
  helper_method :current_year, :to_thousands
  
  def current_year
    @current_year = (params[:year] || session[:year] || 2012)
    session[:year] = @current_year
  end
  
  private
  def set_default_year
    self.default_url_options[:year] = current_year
  end
  
  def to_thousands(number)
    (number.to_f / 10**3).round
  end  
end
