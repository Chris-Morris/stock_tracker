class AddsColumnsToScans < ActiveRecord::Migration[7.0]
  def change
    add_column :scans, :sector, :string
    add_column :scans, :industry, :string
    add_column :scans, :gross_profit, :decimal
    add_column :scans, :net_profit, :decimal
    add_column :scans, :earning_power, :decimal
    add_column :scans, :return_on_assets, :decimal
    add_column :scans, :return_on_equity, :decimal
    add_column :scans, :debt_ratio, :decimal
    add_column :scans, :debt_to_equity, :decimal
    add_column :scans, :equity_multiplier, :decimal
    add_column :scans, :market_to_debt, :decimal
    add_column :scans, :liabilities_to_assets, :decimal
    add_column :scans, :interest_coverage, :decimal
    add_column :scans, :debt_service_coverage, :decimal
    add_column :scans, :ratings_mean, :decimal
    add_column :scans, :ratings_median, :decimal
    add_column :scans, :current_ratio, :decimal
    add_column :scans, :acid_test, :decimal
    add_column :scans, :cash_ratio, :decimal
    add_column :scans, :operating_cash_ratio, :decimal
    add_column :scans, :inventory_turnover, :decimal
    add_column :scans, :days_sales_outstanding, :decimal
    add_column :scans, :receivables_turnover, :decimal
    add_column :scans, :fixed_assets_turnover, :decimal
    add_column :scans, :total_assets_turnover, :decimal
    add_column :scans, :price_to_earnings, :decimal
    add_column :scans, :market_to_book_value, :decimal
    add_column :scans, :dividends_per_share, :decimal
    add_column :scans, :dividend_payout, :decimal
    add_column :scans, :dividend_yield, :decimal
    add_column :scans, :altman_z_score, :decimal
    add_column :scans, :piotroski_f_score, :decimal
  end
end
