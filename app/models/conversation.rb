class Conversation < ApplicationRecord
  belongs_to :seller
  belongs_to :customer
  has_many :messages, dependent: :destroy
end
