class ZScore
  def initialize(stock)
    @stock = stock
  end

  def z_score

    # Setup
    income_statement = @stock.financials["Income_Statement"]
    balance_sheet = @stock.financials["Balance_Sheet"]
    interval = "yearly"
    keys = @stock.financials["Balance_Sheet"][interval].keys.reverse
    shares_stats = @stock.shares_stats

    # Woking Capital
    working_capital = balance_sheet[interval][keys[0]]["totalCurrentAssets"].to_f / balance_sheet[interval][keys[0]]["totalCurrentLiabilities"].to_f

    # Retained Earnings
    retained_earnings = balance_sheet[interval][keys[0]]["retainedEarnings"].to_f

    # EBIT
    ebit = income_statement[interval][keys[0]]["ebit"].to_f

    # Shares Outstanding
    shares_outstanding = shares_stats["SharesOutstanding"].to_f

    # Total Assets
    total_assets = balance_sheet[interval][keys[0]]["totalAssets"].to_f

    # Total Liabilities
    total_liabilities = balance_sheet[interval][keys[0]]["totalLiab"].to_f

    # Total Revenue
    total_revenue = income_statement[interval][keys[0]]["totalRevenue"].to_f

    # Current Price
    ticker = @stock.general["Code"]
    url = "https://eodhistoricaldata.com/api/eod/#{ticker}.US?api_token=5d1261a6941b19.92876445&fmt=json&order=d"
    response = RestClient.get(url)
    current_price = JSON.parse(response)[0]["close"]

    a = working_capital / total_assets
    b = retained_earnings / total_assets
    c = ebit / total_assets
    d = (shares_outstanding * current_price) / total_liabilities
    e = total_revenue / total_assets

    return (a * 1.2) + (b * 1.4) + (c * 3.3) + (d * 0.6) + (e * 1)
  end
end