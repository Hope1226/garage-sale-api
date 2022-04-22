class Message < ApplicationRecord
  # Validations
  validates :content, presence: { message: 'field can not be blank' }
  belongs_to :conversation
  belongs_to :seller
  belongs_to :customer
end
