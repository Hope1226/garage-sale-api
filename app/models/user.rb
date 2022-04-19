class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :name, presence: { message: 'field can not be blank' }
  
  def customer?
    type == 'customer'
  end

  def seller?
    type == 'seller'
  end
end
