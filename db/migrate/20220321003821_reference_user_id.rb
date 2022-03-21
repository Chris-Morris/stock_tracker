class ReferenceUserId < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :scans, :users
  end
end
