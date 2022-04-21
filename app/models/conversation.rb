class Conversation < ApplicationRecord
  belongs_to :seller
  belongs_to :customer
end
