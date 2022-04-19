class Seller < User
  has_many :stores, dependent: :destroy
  has_many :products, dependent: :destroy
end
