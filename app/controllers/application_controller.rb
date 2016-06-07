class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :date_loaded 

  def date_loaded
    return Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end

end
