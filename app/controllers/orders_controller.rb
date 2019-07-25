class OrdersController < ApplicationController
  before_action :logged_in_user, only: %i[index show new create]
  before_action :user_is_admin, only: %i[destroy edit]
  # before_action :cart_is_empty, only: %i[new create]

  def index
    @orders = Order.all.order(id: :desc)
    @orders = if params[:search]
                Order.search(params[:search]).order('created_at ASC')
                     .paginate(page: params[:page], per_page: 5)
              else
                @orders.order('created_at ASC')
                       .paginate(page: params[:page], per_page: 5)
              end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @cart = @current_cart
  end

  def create
    @order = Order.new(order_params)
    @order.update(user_id: @current_user.id)
    add_order_details_to_order
    @order.save!
    reset_sessions_cart
    redirect_to orders_path
    # byebug
  end

  # def destroy
  #   respond_to do |format|
  #     if @order.destroy!
  #      format.html { redirect_to products_url }
  #      format.json { head :no_content }
  #      flash[:info] = 'Order was successfully destroyed.'
  #     else
  #       flash[:info] = 'Error destroying the order'
  #     end
  #   end
  # end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_path }
      format.json { head :no_content }
      flash[:info] = 'Order was successfully destroyed.'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to orders_path
  end

  def cart_is_empty
    return unless @current_cart.order_details.empty?

    store_location
    flash[:danger] = 'You cart is empty!'
    redirect_to cart_path(@current_cart)
  end

  private

  def add_order_details_to_order
    @current_cart.order_detail.each do |item|
      item.cart_id = nil
      item.order_id = @order.id
      item.save
      @order.order_detail << item
    end
  end

  def reset_sessions_cart
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
  end

  def order_params
    params.require(:order).permit(:user_id, :pay_method, :description)
  end
end
