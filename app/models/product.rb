class Product < ApplicationRecord
  # Validations
  validates :name, presence: { message: 'field can not be blank' }
  validates :description, presence: { message: 'field can not be blank' }
  validates :price, presence: { message: 'field can not be blank' }
  validates :stock, presence: { message: 'field can not be blank' }
  validates :uom, presence: { message: 'field can not be blank' }

  belongs_to :seller
  belongs_to :store
  has_many :orders, dependent: :destroy
  has_many :customers, through: :orders
end
