class StockList < ApplicationRecord
  belongs_to :user
  has_many :stocks
end
