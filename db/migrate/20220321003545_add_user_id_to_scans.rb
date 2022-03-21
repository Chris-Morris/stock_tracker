class AddUserIdToScans < ActiveRecord::Migration[7.0]
  def change
    add_column(:scans, :user_id, :integer)
  end
end
