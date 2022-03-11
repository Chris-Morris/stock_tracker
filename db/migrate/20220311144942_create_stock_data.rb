class CreateStockData < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_data, :id => false do |t|
      t.string :id
      t.jsonb :general
      t.jsonb :highlights
      t.jsonb :valuation
      t.jsonb :shares_stats
      t.jsonb :technicals
      t.jsonb :splits_dividends
      t.jsonb :analyst_ratings
      t.jsonb :holders
      t.jsonb :insider_transactions
      t.jsonb :esg_scores
      t.jsonb :outstanding_shares
      t.jsonb :earnings
      t.jsonb :financials

      t.timestamps
    end
  end
end
