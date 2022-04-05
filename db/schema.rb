# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_05_141002) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scans", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "quarterly_earnings"
    t.decimal "yearly_earnings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.decimal "profit_margin"
    t.string "sector"
    t.string "industry"
    t.decimal "gross_profit"
    t.decimal "net_profit"
    t.decimal "earning_power"
    t.decimal "return_on_assets"
    t.decimal "return_on_equity"
    t.decimal "debt_ratio"
    t.decimal "debt_to_equity"
    t.decimal "equity_multiplier"
    t.decimal "market_to_debt"
    t.decimal "liabilities_to_assets"
    t.decimal "interest_coverage"
    t.decimal "debt_service_coverage"
    t.decimal "ratings_mean"
    t.decimal "ratings_median"
    t.decimal "current_ratio"
    t.decimal "acid_test"
    t.decimal "cash_ratio"
    t.decimal "operating_cash_ratio"
    t.decimal "inventory_turnover"
    t.decimal "days_sales_outstanding"
    t.decimal "receivables_turnover"
    t.decimal "fixed_assets_turnover"
    t.decimal "total_assets_turnover"
    t.decimal "price_to_earnings"
    t.decimal "market_to_book_value"
    t.decimal "dividends_per_share"
    t.decimal "dividend_payout"
    t.decimal "dividend_yield"
    t.decimal "altman_z_score"
    t.decimal "piotroski_f_score"
  end

  create_table "stock_data", id: false, force: :cascade do |t|
    t.string "id"
    t.jsonb "general"
    t.jsonb "highlights"
    t.jsonb "valuation"
    t.jsonb "shares_stats"
    t.jsonb "technicals"
    t.jsonb "splits_dividends"
    t.jsonb "analyst_ratings"
    t.jsonb "holders"
    t.jsonb "insider_transactions"
    t.jsonb "esg_scores"
    t.jsonb "outstanding_shares"
    t.jsonb "earnings"
    t.jsonb "financials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_lists", force: :cascade do |t|
    t.string "ticker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_lists_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_list_id", null: false
    t.index ["user_id", "stock_list_id"], name: "user_stock_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "scans", "users"
end
