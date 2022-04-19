class Order < ApplicationRecord
  # Validation
  validates :quantity, presence: { message: 'field can not be blank' }

  belongs_to :customer
  belongs_to :product

  after_save :update_product_stock

  private

  def update_product_stock
    product.update(stock: product.stock - (quantity / 2))
  end
end
