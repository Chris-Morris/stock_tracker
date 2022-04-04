class StockDatum < ApplicationRecord
  def self.search(id)
    @scan = Scan.where(id: id).first

    # Retrieve all stocks then loop through passing each into the RatioCalculator
    @stocks = StockDatum.all
    ret_array = []
    @stocks.each do |stock|
        ratios = RatioCalculator.new(stock)
        ratings = AnalystRatings.new(stock)
        if @scan.quarterly_earnings?
          next if ratios.return_on_equity <= @scan.quarterly_earnings
        end
        if @scan.profit_margin?
          next if stock.highlights["ProfitMargin"] * 100 <= @scan.profit_margin
        end
        # next if ratings.median_analyst_rating >= @scan.quarterly_earnings
        ret_array.push(stock)
    end

    return ret_array
  end
end
