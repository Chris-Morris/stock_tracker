class StocksController < ApplicationController
  before_action :set_stock, only: %i[ show highlights ratios valuation analyst_ratings earnings financials edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[ edit update destroy ]

  require 'rest-client'

  # GET /stocks or /stocks.json
  def index
    @stocks = StockDatum.all.order(:id)
    @stocks = @stocks.search(params[:scan]) if params[:scan].present?
  end

  # GET /stocks/1 or /stocks/1.json
  def show
  end

  def highlights
    @highlights = @stock.highlights
  end

  def ratios
    @data = @stock
  end

  def valuation
    @valuation = @stock.valuation
  end

  def analyst_ratings
    @analyst_ratings = @stock.analyst_ratings
  end

  def earnings
    @earnings = @stock.earnings
  end

  def financials
    @financials = @stock.financials
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks or /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to stock_url(@stock), notice: "Stock was successfully created." }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1 or /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to stock_url(@stock), notice: "Stock was successfully updated." }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1 or /stocks/1.json
  def destroy
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to stocks_url, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @ticker = current_user.stocks.find_by(id: params[:id])
    redirect_to stocks_path, notice: "Not Authorized to perform this action" if @ticker.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = StockDatum.where(id: params[:id]).first
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:ticker, :user_id)
    end
end
