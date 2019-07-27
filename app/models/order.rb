class Order < ApplicationRecord
  belongs_to :user
  has_many :order_detail, dependent: :destroy


  def sub_total
      sum = 0
      order_detail.each do |item|
        sum += item.total_price
      end
      sum
  end


  def self.search(search)
    where('title LIKE ?', "%#{search}%")
  end
end
