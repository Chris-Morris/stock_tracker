class StockDatum < ApplicationRecord
  belongs_to :stock_data
  def self.search(id)
    @scan = Scan.where(id: id).first

    # Retrieve all stocks then loop through passing each into the RatioCalculator
    @stocks = StockDatum.all
    ret_array = []
    @stocks.each do |stock|
        ratios = RatioCalculator.new(stock)
        ratings = AnalystRatings.new(stock)
        zscore = ZScore.new(stock)

        # General
        if @scan.sector?
          next if stock.general["Sector"] != @scan.sector
        end

        # Liquidity
        if @scan.current_ratio?
          next if ratios.current_ratio < @scan.current_ratio
        end

        if @scan.acid_test?
          next if ratios.acid_test < @scan.acid_test
        end

        if @scan.cash_ratio?
          next if ratios.cash_ratio < @scan.cash_ratio
        end

        if @scan.operating_cash_ratio?
          next if ratios.operating_cash_ratio < @scan.operating_cash_ratio
        end

        # Profitability
        if @scan.gross_profit?
          next if ratios.gross_profit < @scan.gross_profit
        end

        if @scan.net_profit?
          next if ratios.net_profit < @scan.net_profit
        end

        if @scan.earning_power?
          next if ratios.earning_power < @scan.earning_power
        end

        if @scan.return_on_assets?
          next if ratios.return_on_assets < @scan.return_on_assets
        end

        if @scan.return_on_equity?
          next if ratios.return_on_equity < @scan.return_on_equity
        end

        # Leverage
        if @scan.debt_ratio?
          next if ratios.debt_ratio < @scan.debt_ratio
        end

        if @scan.debt_to_equity?
          next if ratios.debt_to_equity < @scan.debt_to_equity
        end

        if @scan.equity_multiplier?
          next if ratios.equity_multiplier < @scan.equity_multiplier
        end

        if @scan.market_to_debt?
          next if ratios.market_to_debt < @scan.market_to_debt
        end

        if @scan.liabilities_to_assets?
          next if ratios.liabilities_assets < @scan.liabilities_assets
        end

        if @scan.interest_coverage?
          next if ratios.interest_coverage < @scan.interest_coverage
        end

        if @scan.debt_service_coverage?
          next if ratios.debt_service_coverage < @scan.debt_service_coverage
        end

        # Analyst Ratings
        if @scan.ratings_mean?
          begin
            next if stock.analyst_ratings["Rating"] < @scan.ratings_mean
          rescue
            puts stock.id
          end
        end

        if @scan.ratings_median?
          next if ratios.ratings_median < @scan.ratings_median
        end

        # Asset Management
        if @scan.inventory_turnover?
          next if ratios.inventory_turnover < @scan.inventory_turnover
        end

        if @scan.days_sales_outstanding?
          next if ratios.days_sales_outstanding < @scan.days_sales_outstanding
        end

        if @scan.receivables_turnover?
          next if ratios.receivables_turnover < @scan.receivables_turnover
        end

        if @scan.fixed_assets_turnover?
          next if ratios.fixed_assets_turnover < @scan.fixed_assets_turnover
        end

        if @scan.total_assets_turnover?
          next if ratios.total_assets_turnover < @scan.total_assets_turnover
        end

        # Market Value
        if @scan.price_to_earnings?
          next if ratios.price_to_earnings < @scan.price_to_earnings
        end

        if @scan.market_to_book_value?
          next if ratios.market_to_book_value < @scan.market_to_book_value
        end

        if @scan.dividends_per_share?
          next if ratios.dividends_per_share < @scan.dividends_per_share
        end

        if @scan.dividend_payout?
          next if ratios.dividend_payout < @scan.dividend_payout
        end

        if @scan.dividend_yield?
          next if ratios.dividend_yield < @scan.dividend_yield
        end

        # Altman Z-Score & Piotroski F-Index
        if @scan.altman_z_score?
          next if zscore.z_score < @scan.altman_z_score
        end

        if @scan.piotroski_f_score?
          next if zscore.piotroski_f_score < @scan.piotroski_f_score
        end

        # next if ratings.median_analyst_rating >= @scan.quarterly_earnings
        ret_array.push(stock)
    end

    return ret_array
  end
end
