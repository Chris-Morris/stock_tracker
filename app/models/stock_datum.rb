class StockDatum < ApplicationRecord
  
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
          begin
            next if stock.general["Sector"] != @scan.sector
          rescue
            puts stock.id
            next
          end
        end

        # Liquidity
        if @scan.current_ratio?
          begin
            next if ratios.current_ratio < @scan.current_ratio
          rescue
            puts stock.id
            next
          end
        end

        if @scan.acid_test?
          begin
            next if ratios.acid_test < @scan.acid_test
          rescue
            puts stock.id
            next
          end
        end

        if @scan.cash_ratio?
          begin
            next if ratios.cash_ratio < @scan.cash_ratio
          rescue
            puts stock.id
            next
          end
        end

        if @scan.operating_cash_ratio?
          begin
            next if ratios.operating_cash_ratio < @scan.operating_cash_ratio
          rescue
            puts stock.id
            next
          end
        end

        # Profitability
        if @scan.gross_profit?
          begin
            next if ratios.gross_profit < @scan.gross_profit
          rescue
            puts stock.id
            next
          end
        end

        if @scan.net_profit?
          begin
            next if ratios.net_profit < @scan.net_profit
          rescue
            puts stock.id
            next
          end
        end

        if @scan.earning_power?
          begin
            next if ratios.earning_power < @scan.earning_power
          rescue
            puts stock.id
            next
          end
        end

        if @scan.return_on_assets?
          begin
            next if ratios.return_on_assets < @scan.return_on_assets
          rescue
            puts stock.id
            next
          end
        end

        if @scan.return_on_equity?
          begin
            next if ratios.return_on_equity < @scan.return_on_equity
          rescue
            puts stock.id
            next
          end
        end

        # Leverage
        if @scan.debt_ratio?
          begin
            next if ratios.debt_ratio < @scan.debt_ratio
          rescue
            puts stock.id
            next
          end
        end

        if @scan.debt_to_equity?
          begin
            next if ratios.debt_to_equity < @scan.debt_to_equity
          rescue
            puts stock.id
            next
          end
        end

        if @scan.equity_multiplier?
          begin
            next if ratios.equity_multiplier < @scan.equity_multiplier
          rescue
            puts stock.id
            next
          end
        end

        if @scan.market_to_debt?
          begin
            next if ratios.market_to_debt < @scan.market_to_debt
          rescue
            puts stock.id
            next
          end
        end

        if @scan.liabilities_to_assets?
          begin
            next if ratios.liabilities_assets < @scan.liabilities_assets
          rescue
            puts stock.id
            next
          end
        end

        if @scan.interest_coverage?
          begin
            next if ratios.interest_coverage < @scan.interest_coverage
          rescue
            puts stock.id
            next
          end
        end

        if @scan.debt_service_coverage?
          begin
            next if ratios.debt_service_coverage < @scan.debt_service_coverage
          rescue
            puts stock.id
            next
          end
        end

        # Analyst Ratings
        if @scan.ratings_mean?
          begin
            next if stock.analyst_ratings["Rating"] < @scan.ratings_mean
          rescue
            puts stock.id
            next
          end
        end

        if @scan.ratings_median?
          begin
            next if ratios.ratings_median < @scan.ratings_median
          rescue
            puts stock.id
            next
          end
        end

        # Asset Management
        if @scan.inventory_turnover?
          begin
            next if ratios.inventory_turnover < @scan.inventory_turnover
          rescue
            puts stock.id
            next
          end
        end

        if @scan.days_sales_outstanding?
          begin
            next if ratios.days_sales_outstanding < @scan.days_sales_outstanding
          rescue
            puts stock.id
            next
          end
        end

        if @scan.receivables_turnover?
          begin
            next if ratios.receivables_turnover < @scan.receivables_turnover
          rescue
            puts stock.id
            next
          end
        end

        if @scan.fixed_assets_turnover?
          begin
            next if ratios.fixed_assets_turnover < @scan.fixed_assets_turnover
          rescue
            puts stock.id
            next
          end
        end

        if @scan.total_assets_turnover?
          begin
            next if ratios.total_assets_turnover < @scan.total_assets_turnover
          rescue
            puts stock.id
            next
          end
        end

        # Market Value
        if @scan.price_to_earnings?
          begin
            next if ratios.price_to_earnings < @scan.price_to_earnings
          rescue
            puts stock.id
            next
          end
        end

        if @scan.market_to_book_value?
          begin
            next if ratios.market_to_book_value < @scan.market_to_book_value
          rescue
            puts stock.id
            next
          end
        end

        if @scan.dividends_per_share?
          begin
            next if ratios.dividends_per_share < @scan.dividends_per_share
          rescue
            puts stock.id
            next
          end
        end

        if @scan.dividend_payout?
          begin
            next if ratios.dividend_payout < @scan.dividend_payout
          rescue
            puts stock.id
            next
          end
        end

        if @scan.dividend_yield?
          begin
            next if ratios.dividend_yield < @scan.dividend_yield
          rescue
            puts stock.id
            next
          end
        end

        # Altman Z-Score & Piotroski F-Index
        if @scan.altman_z_score?
          begin
            next if zscore.z_score < @scan.altman_z_score
          rescue
            puts stock.id
            next
          end
        end

        if @scan.piotroski_f_score?
          begin
            next if zscore.piotroski_f_score < @scan.piotroski_f_score
          rescue
            puts stock.id
            next
          end
        end

        # next if ratings.median_analyst_rating >= @scan.quarterly_earnings
        ret_array.push(stock)
    end

    return ret_array
  end
end
