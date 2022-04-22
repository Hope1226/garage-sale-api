class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :seller
  belongs_to :customer
end
