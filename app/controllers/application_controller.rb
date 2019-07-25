class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :only => :current_cart

  before_action :set_cart

  private

  def set_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      cart.present? ? (@current_cart = cart) : (session[:cart_id] = nil)
    end
    return unless session[:cart_id].nil?
    if user_signed_in?
       @current_cart = Cart.create(:user_id => current_user.id )
     session[:cart_id] = @current_cart.id
  end
end
   def logged_in_user
    return if user_signed_in?

    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def user_is_admin
    return if user_signed_in? && current_user.admin?

    flash[:info] = "You don't have the privilages for this action!"
    redirect_back(fallback_location: root_url)
  end
end
