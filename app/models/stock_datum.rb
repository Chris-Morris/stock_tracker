class StockDatum < ApplicationRecord
  def search(id)
    Scan.where(id: id)
  end
end
