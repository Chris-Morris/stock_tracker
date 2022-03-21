tickers = ["TSLA", "GOOG", "FB", "UBER", "LYFT", "AA", "MSFT", "F", "MMM", "ANF", "ADBE", "AIG", "AA", "BABA", "MO", "AMZN", "AXP", "AAPL", "T", "BIDU", "BA", "BAC", "CAT", "BMY", "CVX", "CSCO", "C", "KO", "CMCSA", "COP", "COST", "DIS", "EBAY", "XOM", "FDX", "RACE", "GE", "GM", "GS", "HAL", "HOG", "HD", "HON", "HPQ", "IBM", "INTC", "JNJ", "JPM", "KHC", "LVS", "MS", "MA", "MCD", "MRK", "MGM", "MCO", "MSI", "NFLX", "NKE", "NVDA", "NVS", "ORCL", "PG", "PEP", "PBR", "PFE", "PM", "QCOM", "SCHW", "SHAK",  "SONY", "SBUX", "TM", "TRIP", "TWTR", "UPS", "V", "VALE", "VZ", "WMT", "WFC", "YNDX", "YUM", "PZZA", "BB", "AMC", "GME", "TLRY", "NOK", "CLOV", "CLNE", "PLTR", "RKT", "WKHS", "SPCE", "AMD", "RBLX", "NKLA", "NIO", "XPEV", "LI", "ZM", "SQ", "CRM", "MSTR", "SKLZ", "COIN", "GH", "MVIS", "PTON", "ETSY", "BBY", "MRNA", "LMND", "ABNB", "SNOW", "DKNG", "BYND", "ROKU", "SNAP", "PENN", "FUBO", "BIIB", "FCEL", "MRVL", "SFIX", "WEN", "PLUG", "OCGN", "WISH", "SIRI", "PLAY", "VXRT", "LLY", "GEVO", "FSLY", "BNGO", "MNDY", "MQ", "RERE", "FIGS", "WKME", "ROOT", "SUMO", "COMP", "CCCC", "CRSR", "FROG", "COUR", "CVAC", "AI", "DOCS", "YMM", "AFRM", "PATH", "ZIP", "APP", "OTLY", "SQSP", "U", "BMBL", "CPNG", "DASH", "OSCR", "LFST", "BHG", "CFLT", "DNUT", "S", "DIDI", "OZON", "LU", "AGL", "BZ", "DLO", "TUYA", "HAYW", "RLX", "DOCN", "OSH", "PCOR", "THRY", "PRVA", "MCW", "GLBE", "BNL", "LZ", "ATC", "VERV", "SGFY", "ZH", "YOU", "SWIM", "OLO", "XMTR", "TIXT"]
api_key = '5d1261a6941b19.92876445'

tickers.each do |ticker|
    url = "https://eodhistoricaldata.com/api/fundamentals/#{ticker}.US?api_token=#{api_key}"
    response = RestClient.get(url)
    json = JSON.parse(response)
    general = json["General"]
    stock = StockDatum.new
    stock.id = json["General"]["Code"]
    stock.general = json["General"]
    stock.highlights = json["Highlights"]
    stock.valuation = json["Valuation"]
    stock.shares_stats = json["SharesStats"]
    stock.technicals = json["Technicals"]
    stock.splits_dividends = json["SplitsDividends"]
    stock.analyst_ratings = json["AnalystRatings"]
    stock.holders = json["Holders"]
    stock.insider_transactions = json["InsiderTransactions"]
    stock.esg_scores = json["ESGScores"]
    stock.outstanding_shares = json["outstandingShares"]
    stock.earnings = json["Earnings"]
    stock.financials = json["Financials"]
    stock.save
end