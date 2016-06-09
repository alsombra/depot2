class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ActionView::Helpers::TextHelper
  protect_from_forgery with: :exception
  helper_method :date_loaded
  helper_method :show_session_counter_message

  def date_loaded
    return Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end
end
