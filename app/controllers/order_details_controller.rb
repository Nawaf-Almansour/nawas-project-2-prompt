class OrderDetailsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy add_quantity
                                          reduce_quantity]


    def create
      #code
      chosen_book = Book.find(params[:book_id])
      add_books_to_cart(chosen_book)
      respond_to do |format|
        if @order_detail.save!
          format.html { redirect_back(fallback_location: @current_cart) }
        else
          format.html { render :new, notice: 'Error adding product to basket!' }
        end
      end
    end

    def destroy
      #code
      @order_detail = OrderDetail.find(params[:id])
      @order_detail.destroy
      redirect_back(fallback_location: @current_cart)
    end

    def add_quantity
      #code
      @order_detail = OrderDetail.find(params[:id])
      @order_detail.quantity += 1
       @order_detail.save
       redirect_back(fallback_location: @current_cart)
    end


    def reduce_quantity
      #code
      @order_detail = OrderDetail.find(params[:id])
      if @order_detail.quantity > 1
         @order_detail.quantity -= 1
         @order_detail.save
        redirect_back(fallback_location: @current_cart)
      elsif @order_detail.quantity == 1
        destroy
      end
    end

    private

    def order_detail_paramrs
      params.require(:order_detail).permit(:quantity, :book_id, :cart_id)
    end

    def add_books_to_cart(chosen_book)
      if @current_cart.books.include?(chosen_book)
         @order_detail = @current_cart.order_details.find_by(book_id: chosen_book)
         @order_detail.quantity += 1
      else
          @order_detail = OrderDetail.new
          @order_detail.cart = @current_cart
          @order_detail.book = chosen_book
          @order_detail.quantity = 1
      end
    end
end
