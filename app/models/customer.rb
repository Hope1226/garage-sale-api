class Customer < User
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders
end
