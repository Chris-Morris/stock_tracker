module RatiosHelper

  api_key = '5d1261a6941b19.92876445'

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

    # Current Ratio
    return ((@balance_sheet[@interval][@keys[0]]["totalCurrentAssets"].to_f - @balance_sheet[@interval][@keys[0]]["inventory"].to_f) / @balance_sheet[@interval][@keys[0]]["totalCurrentLiabilities"].to_f).round(2)
  end

  def gross_profit(stock)
    # Setup
    @income_statement = stock.financials["Income_Statement"]
    @interval = "yearly"
    @keys = stock.financials["Income_Statement"][@interval].keys.reverse

    # Current Ratio
    return ((@income_statement[@interval][@keys[0]]["grossProfit"].to_f / @income_statement[@interval][@keys[0]]["totalRevenue"].to_f) * 100).round(2)
  end

  def mark_up(stock)
    # Setup
    @income_statement = stock.financials["Income_Statement"]
    @interval = "yearly"
    @keys = stock.financials["Income_Statement"][@interval].keys.reverse

    # Current Ratio
    return ((@income_statement[@interval][@keys[0]]["grossProfit"].to_f / @income_statement[@interval][@keys[0]]["costOfRevenue"].to_f) * 100).round(2)
  end

  def net_profit(stock)
    # Setup
    

    # Current Ratio
    return ((@income_statement[@interval][@keys[0]]["incomeBeforeTax"].to_f / @income_statement[@interval][@keys[0]]["totalRevenue"].to_f) * 100).round(2)
  end

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
    # Current Price
    ticker = stock.general["Code"]
    url = "https://eodhistoricaldata.com/api/eod/#{ticker}.US?api_token=5d1261a6941b19.92876445&fmt=json&order=d"
    response = RestClient.get(url)
    @current_price = JSON.parse(response)[0]["close"]
    
    return (@current_price / stock.highlights["EarningsShare"].to_f).round(2)
  end

  def capital_gearing(stock)
    nil
  end
end