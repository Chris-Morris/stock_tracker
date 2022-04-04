class AnalystRatings
  def initialize(stock)
    @ratings = stock.analyst_ratings
  end

  def median_analyst_rating
    @ratings_array = []
    @ratings["StrongSell"].times do
      @ratings_array.push(1)
    end

    @ratings["Sell"].times do
      @ratings_array.push(2)
    end

    @ratings["Hold"].times do
      @ratings_array.push(3)
    end

    @ratings["Buy"].times do
      @ratings_array.push(4)
    end

    @ratings["StrongBuy"].times do
      @ratings_array.push(5)
    end

    @median_index = (@ratings_array.length / 2).round()
    return @ratings_array[@median_index]
  end
end