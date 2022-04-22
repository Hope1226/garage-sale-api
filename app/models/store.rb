class Store < ApplicationRecord
  # Validations
  validates :name, presence: { message: 'field can not be blank' }
  validates :description, presence: { message: 'field can not be blank' }
  validates :category, presence: { message: 'field can not be blank' }

  belongs_to :seller
  has_many :products, dependent: :destroy
end
