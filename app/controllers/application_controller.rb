class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :user_has_a_cart

  def cart
    @cart ||= Cart.find session[:cart_id]
  end

  private

  def user_has_a_cart
    return if session[:cart_id]
    cart = Cart.create!
    session[:cart_id] = cart.id
  end
end
