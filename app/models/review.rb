class Review < ApplicationRecord
  # Validations
  validates :content, presence: { message: 'field can not be blank' }

  belongs_to :product
  belongs_to :customer
end
