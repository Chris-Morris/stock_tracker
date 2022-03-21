class CreateScans < ActiveRecord::Migration[7.0]
  def change
    create_table :scans do |t|
      t.string :title
      t.text :description
      t.decimal :quarterly_earnings
      t.decimal :yearly_earnings

      t.timestamps
    end
  end
end
