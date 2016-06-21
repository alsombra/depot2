class ApplicationController < ActionController::Base
  before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ActionView::Helpers::TextHelper
  protect_from_forgery with: :exception
  helper_method :date_loaded
  helper_method :show_session_counter_message

  def date_loaded
    return Time.now.strftime("%Y-%m-%d %H:%M")
  end

  protected

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end  
    end
end
