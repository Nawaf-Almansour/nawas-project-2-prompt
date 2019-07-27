class Book < ApplicationRecord
  has_many :order_detail, dependent: :destroy
  has_many :orders, through: :order_detail


  def self.search(search)
      where('title LIKE ?', "%#{search}%")
  end

  self.per_page = 10

end
