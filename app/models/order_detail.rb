class OrderDetail < ApplicationRecord
  # belongs_to :order
  belongs_to :book
  belongs_to :cart


  def total_price
    if valid_quantity_and_price?
      quantity.to_s.to_d * book.price.to_s.to_d

    else
       0.0
    end
  end



  def valid_quantity_and_price?
    !quantity.to_s.strip.empty?  && !book.price.to_s.strip.empty?
    #code
  end


end
