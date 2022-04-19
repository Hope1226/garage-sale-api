class Order < ApplicationRecord
  # Validation
  validates :quantity, presence: { message: 'field can not be blank' }

  belongs_to :customer
  belongs_to :product
end
