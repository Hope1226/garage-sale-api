class Customer < User
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders
  has_many :ranks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :conversations, dependent: :destroy
end
