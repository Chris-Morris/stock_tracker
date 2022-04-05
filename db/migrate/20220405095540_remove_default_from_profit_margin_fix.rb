class RemoveDefaultFromProfitMarginFix < ActiveRecord::Migration[7.0]
  def change
    change_column_default :scans, :profit_margin, nil
  end
end
