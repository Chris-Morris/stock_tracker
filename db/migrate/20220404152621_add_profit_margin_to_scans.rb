class AddProfitMarginToScans < ActiveRecord::Migration[7.0]
  def change
    add_column :scans, :profit_margin, :decimal
  end
end
