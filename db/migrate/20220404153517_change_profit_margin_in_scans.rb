class ChangeProfitMarginInScans < ActiveRecord::Migration[7.0]
  def change
    change_column :scans, :profit_margin, :decimal, default: 0.0
  end
end
