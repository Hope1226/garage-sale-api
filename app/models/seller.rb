class Seller < User
  has_many :stores, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :conversations
  has_many :messages
end
