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

  def increment_session_counter
    session[:counter] ||= 0
    session[:counter] += 1
  end

  def reset_session_counter
    if not session[:counter].nil?
      session[:counter] = 0
    end
  end

  def show_session_counter_message
    @counter = session[:counter]
    if @counter>5
      @counter_message = pluralize("You've been here #{@counter}", 'times')
    else
      @counter_message = pluralize(@counter, "time")
    return @counter_message
    end
  end
end
