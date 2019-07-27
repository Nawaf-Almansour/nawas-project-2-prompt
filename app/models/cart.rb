class Cart < ApplicationRecord
  belongs_to :user
  has_many :order_detail
  has_many :books, through: :order_detail

  def sub_total
    sum = 0
    order_detail.each do |item|
      sum+= item.total_price
    end
    sum
  end
end
