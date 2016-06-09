class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    increment_session_counter
  end
end
