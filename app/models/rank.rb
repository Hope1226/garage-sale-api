class Rank < ApplicationRecord
  # Validations
  validates :score, presence: { message: 'field can not be blank' }
  validates :score, comparison: { greater_than: 0, less_than_or_equal_to: 5 }
  belongs_to :customer
  belongs_to :product

  after_save :update_product_rank

  private

  def update_product_rank
    scores = product.ranks.split.last.map(&:score)
    product.update(rank: scores.sum / scores.length)
  end
end
