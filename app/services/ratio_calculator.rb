class RatioCalculator
  def initialize(stock)
    @stock = stock

    # Balance Sheet Setup
    @yearly_balance_sheet_keys = @stock.financials["Balance_Sheet"]["yearly"].keys.reverse
    @yearly_balance_sheet = @stock.financials["Balance_Sheet"]["yearly"][@yearly_balance_sheet_keys[0]]
    @quarter_balance_sheet_keys = @stock.financials["Balance_Sheet"]["quarterly"].keys.reverse
    @quarter_balance_sheet = @stock.financials["Balance_Sheet"]["quarterly"][@quarter_balance_sheet_keys[0]]

    # Cash Flow Setup
    @yearly_cash_flow_keys = @stock.financials["Cash_Flow"]["yearly"].keys.reverse
    @yearly_cash_flow = @stock.financials["Cash_Flow"]["yearly"][@yearly_cash_flow_keys[0]]
    @quarter_cash_flow_keys = @stock.financials["Cash_Flow"]["quarterly"].keys.reverse
    @quarter_cash_flow = @stock.financials["Cash_Flow"]["quarterly"][@quarter_cash_flow_keys[0]]

    # Income Statement Setup
    @yearly_income_statement_keys = @stock.financials["Income_Statement"]["yearly"].keys.reverse
    @yearly_income_statement = @stock.financials["Income_Statement"]["yearly"][@yearly_income_statement_keys[0]]
    @quarter_income_statement_keys = @stock.financials["Income_Statement"]["quarterly"].keys.reverse
    @quarter_income_statement = @stock.financials["Income_Statement"]["quarterly"][@quarter_income_statement_keys[0]]
    
    @api_key = '5d1261a6941b19.92876445'
  end

  # ---------------- General Ratios ----------------
  def operational_gearing
    nil
  end

  # ---------------- Liquidity Ratios ----------------
  def current_ratio
    (@yearly_balance_sheet["totalCurrentAssets"].to_f / @yearly_balance_sheet["totalCurrentLiabilities"].to_f).round(2)
  end

  def acid_test
    ((@yearly_balance_sheet["totalCurrentAssets"].to_f - @yearly_balance_sheet["inventory"].to_f) / @yearly_balance_sheet["totalCurrentLiabilities"].to_f).round(2)
  end

  def cash_ratio
    ((@yearly_balance_sheet["cashAndShortTermInvestments"].to_f - @yearly_balance_sheet["cash"].to_f) / @yearly_balance_sheet["totalCurrentLiabilities"].to_f).round(2)
  end

  def operating_cash_ratio
    @operating_income = @yearly_income_statement["operatingIncome"].to_f
    @depreciation = @yearly_income_statement["reconciledDepreciation"].to_f
    @tax = @yearly_income_statement["incomeTaxExpense"].to_f
    @change_in_working_capital = @yearly_cash_flow["changeInWorkingCapital"].to_f
    @current_liabilities = @yearly_balance_sheet["totalCurrentLiabilities"].to_f

    (((@operating_income + @depreciation) - (@tax + @change_in_working_capital)) / @current_liabilities).round(2)
  end

  # ---------------- Profitability Ratios ----------------
  def gross_profit
    ((@yearly_income_statement["grossProfit"].to_f / @yearly_income_statement["totalRevenue"].to_f) * 100).round(2)
  end

  def mark_up
    ((@yearly_income_statement["grossProfit"].to_f / @yearly_income_statement["costOfRevenue"].to_f) * 100).round(2)
  end

  def net_profit
    ((@yearly_income_statement["netIncome"].to_f / @yearly_income_statement["totalRevenue"].to_f) * 100).round(2)
  end

  def earning_power
    (@yearly_income_statement["operatingIncome"].to_f / @yearly_balance_sheet["totalAssets"].to_f).round(2)
  end

  def return_on_assets
    ((@yearly_income_statement["netIncome"].to_f / @yearly_balance_sheet["totalAssets"].to_f) * 100).round(2)
  end

  def return_on_equity
    ((@yearly_income_statement["netIncome"].to_f / @yearly_balance_sheet["totalStockholderEquity"].to_f) * 100).round(2)
  end

  # ---------------- Leverage Ratios ----------------
  def debt_ratio
    (@yearly_balance_sheet["shortLongTermDebtTotal"].to_f / @yearly_balance_sheet["totalAssets"].to_f).round(2)
  end

  def debt_to_equity
    (@yearly_balance_sheet["shortLongTermDebtTotal"].to_f / @yearly_balance_sheet["totalStockholderEquity"].to_f).round(2)
  end

  def equity_multiplier
    (@yearly_balance_sheet["totalAssets"].to_f / @yearly_balance_sheet["totalStockholderEquity"].to_f).round(2)
  end

  def market_to_debt
    nil
  end

  def liabilities_to_assets
    (@yearly_balance_sheet["totalAssets"].to_f / @yearly_balance_sheet["totalLiab"].to_f).round(2)
  end

  def interest_coverage
    (@yearly_income_statement["operatingIncome"].to_f / @yearly_income_statement["interestExpense"].to_f).round(2)
  end

  def debt_service_coverage
    nil
  end

  # ---------------- Valuation Ratios ----------------
  def dividend_yield
    @stock.highlights["DividendYield"].to_f
  end

  def dividend_cover
    nil
  end

  def earnings_per_share
    @stock.highlights["EarningsShare"].to_f
  end

  def price_to_earnings
    # Setup
    @ticker = @stock.general["Code"]
    @url = "https://eodhistoricaldata.com/api/eod/#{@ticker}.US?api_token=#{@api_key}&fmt=json&order=d"
    @response = RestClient.get(@url)
    @current_price = JSON.parse(@response)[0]["close"]
    
    # Current Price
    return (@current_price / @stock.highlights["EarningsShare"].to_f).round(2)
  end

  # ---------------- Efficiency Ratios ----------------
  def inventory_turnover
    nil
  end

  def days_sales_outstanding
    nil
  end

  def receivables_turnover
    nil
  end

  def fixed_assets_turnover
    nil
  end

  def total_assets_turnover
    nil
  end
end