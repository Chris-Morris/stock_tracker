class RemoveDefaultFromProfitMargin < ActiveRecord::Migration[7.0]
  def change
    change_column :scans, :profit_margin, :decimal
  end
end
