class Customer < User
  has_many :orders, through: :products
end
