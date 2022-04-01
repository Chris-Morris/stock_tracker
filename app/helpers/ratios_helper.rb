module RatiosHelper

  api_key = '5d1261a6941b19.92876445'

  # ---------------- Liquidity Ratios ----------------
  def current_ratio(stock)
    # Setup
    @balance_sheet = stock.financials["Balance_Sheet"]
    @interval = "yearly"
    @keys = stock.financials["Balance_Sheet"][@interval].keys.reverse
    @shares_stats = stock.shares_stats

    # Current Ratio
    return (@balance_sheet[@interval][@keys[0]]["totalCurrentAssets"].to_f / @balance_sheet[@interval][@keys[0]]["totalCurrentLiabilities"].to_f).round(2)
  end

  def acid_test(stock)
    # Setup
    @balance_sheet = stock.financials["Balance_Sheet"]
    @interval = "yearly"
    @keys = stock.financials["Balance_Sheet"][@interval].keys.reverse

    # Acid Test
    return ((@balance_sheet[@interval][@keys[0]]["totalCurrentAssets"].to_f - @balance_sheet[@interval][@keys[0]]["inventory"].to_f) / @balance_sheet[@interval][@keys[0]]["totalCurrentLiabilities"].to_f).round(2)
  end

  def cash_ratio(stock)
    # Setup
    @balance_sheet = stock.financials["Balance_Sheet"]
    @interval = "yearly"
    @keys = stock.financials["Balance_Sheet"][@interval].keys.reverse

    # Cash Ratio
    return ((@balance_sheet[@interval][@keys[0]]["cashAndShortTermInvestments"] - @balance_sheet[@interval][@keys[0]]["cash"]) / @balance_sheet[@interval][@keys[0]]["totalCurrentLiabilities"])
  end

  def operating_cash_ratio(stock)
    # Setup
    @balance_sheet = stock.financials["Balance_Sheet"]
    @income_statement = stock.financials["Income_Statement"]
    @cash_flow = stock.financials["Cash_Flow"]
    @interval = "yearly"
    @keys = stock.financials["Balance_Sheet"][@interval].keys.reverse

    # Operating Cash Ratio
    # Operating Cash Flow = Operating Income + Depreciation – Taxes + Change in Working Capital.
    operating_income = @income_statement[@interval][@keys[0]]["operatingIncome"].to_f
    depreciation = @income_statement[@interval][@keys[0]]["reconciledDepreciation"].to_f
    tax = @income_statement[@interval][@keys[0]]["incomeTaxExpense"].to_f
    change_in_working_capital = @cash_flow[@interval][@keys[0]]["changeInWorkingCapital"].to_f
    current_liabilities = @balance_sheet[@interval][@keys[0]]["totalCurrentLiabilities"].to_f
    return (((operating_income + depreciation) - (tax + change_in_working_capital)) / current_liabilities).round(2)
  end

  # ---------------- Profitability Ratios ----------------
  def gross_profit(stock)
    # Setup
    @income_statement = stock.financials["Income_Statement"]
    @interval = "yearly"
    @keys = stock.financials["Income_Statement"][@interval].keys.reverse

    # Gross Profit
    return ((@income_statement[@interval][@keys[0]]["grossProfit"].to_f / @income_statement[@interval][@keys[0]]["totalRevenue"].to_f) * 100).round(2)
  end

  def mark_up(stock)
    # Setup
    @income_statement = stock.financials["Income_Statement"]
    @interval = "yearly"
    @keys = stock.financials["Income_Statement"][@interval].keys.reverse

    # Markup
    return ((@income_statement[@interval][@keys[0]]["grossProfit"].to_f / @income_statement[@interval][@keys[0]]["costOfRevenue"].to_f) * 100).round(2)
  end

  def net_profit(stock)
    # Setup
    

    # Net Profit
    return ((@income_statement[@interval][@keys[0]]["incomeBeforeTax"].to_f / @income_statement[@interval][@keys[0]]["totalRevenue"].to_f) * 100).round(2)
  end

  def earning_power(stock)
    return (@income_statement[@interval][@keys[0]]["operatingIncome"].to_f / @balance_sheet[@interval][@keys[0]]["totalCurrentAssets"].to_f).round(2)
  end

  def return_on_assets(stock)
    return (@income_statement[@interval][@keys[0]]["netIncome"].to_f / @balance_sheet[@interval][@keys[0]]["totalCurrentAssets"].to_f).round(2)
  end

  def return_on_equity(stock)
    # Setup
    @balance_sheet = stock.financials["Balance_Sheet"]
    @income_statement = stock.financials["Income_Statement"]
    @interval = "yearly"
    @keys = stock.financials["Income_Statement"][@interval].keys.reverse

    return (@income_statement[@interval][@keys[0]]["netIncome"].to_f / @balance_sheet[@interval][@keys[0]]["totalStockholderEquity"].to_f).round(2)
  end

  # ---------------- Leverage Ratios ----------------
  def debt_ratio(stock)
    nil
  end

  def debt_equity_ratio(stock)
    nil
  end

  def equity_multiplier(stock)
    nil
  end

  def market_debt_ratio(stock)
    nil
  end

  def liabilities_assets_ratio(stock)
    nil
  end

  def interest_coverage_ratio(stock)
    nil
  end

  def debt_service_coverage_ratio(stock)
    nil
  end

  # ---------------- Valuation Ratios ----------------
  def dividend_yield(stock)
    stock.highlights["DividendYield"].to_f
  end

  def dividend_cover(stock)
    nil
  end

  def earnings_per_share(stock)
    stock.highlights["EarningsShare"].to_f
  end

  def price_to_earnings(stock)
    # Setup
    ticker = stock.general["Code"]
    url = "https://eodhistoricaldata.com/api/eod/#{ticker}.US?api_token=5d1261a6941b19.92876445&fmt=json&order=d"
    response = RestClient.get(url)
    @current_price = JSON.parse(response)[0]["close"]
    
    # Current Price
    return (@current_price / stock.highlights["EarningsShare"].to_f).round(2)
  end

  def capital_gearing(stock)
    nil
  end

  # ---------------- Efficiency Ratios ----------------
  def inventory_turnover_ratio(stock)
    nil
  end

  def days_sales_outstanding(stock)
    nil
  end

  def receivables_turnover_ratio(stock)
    nil
  end

  def fixed_assets_turnover_ratio(stock)
    nil
  end

  def total_assets_turnover_ratio(stock)
    nil
  end
end