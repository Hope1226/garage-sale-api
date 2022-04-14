class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :name, presence: { message: 'field can not be blank' }

  has_many :stores, dependent: :destroy
  has_many :products, dependent: :destroy
end
