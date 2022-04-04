class StockDatum < ApplicationRecord
  def self.search(id)
    @scan = Scan.where(id: id).first

    # Retrieve all stocks then loop through passing each into the RatioCalculator
    @stocks = StockDatum.all
    ret_array = []
    @stocks.each do |stock|
        ratios = RatioCalculator.new(stock)
        if ratios.current_ratio >= @scan.quarterly_earnings
            ret_array.push(stock)
        end
    end
    
    return ret_array
  end
end
