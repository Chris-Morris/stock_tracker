module StocksHelper
  def sort_link(column:, label:)
    link_to(label, list_stocks_path(column: column))
  end

  def currency(num)
    number_to_currency(num, precision: 0)
  end
end