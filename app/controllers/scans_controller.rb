class ScansController < ApplicationController
  before_action :set_scan, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /scans or /scans.json
  def index
    if user_signed_in?
      @scans = Scan.where(user_id: current_user.id)
    else
      @scans = Scan.all
    end
  end

  # GET /scans/1 or /scans/1.json
  def show
  end

  # GET /scans/new
  def new
    @scan = Scan.new
  end

  # GET /scans/1/edit
  def edit
  end

  # POST /scans or /scans.json
  def create
    @scan = Scan.new(scan_params)
    @scan.user_id = current_user.id

    respond_to do |format|
      if @scan.save
        format.html { redirect_to scan_url(@scan), notice: "Scan was successfully created." }
        format.json { render :show, status: :created, location: @scan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scans/1 or /scans/1.json
  def update
    respond_to do |format|
      if @scan.update(scan_params)
        format.html { redirect_to scan_url(@scan), notice: "Scan was successfully updated." }
        format.json { render :show, status: :ok, location: @scan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scans/1 or /scans/1.json
  def destroy
    @scan.destroy

    respond_to do |format|
      format.html { redirect_to scans_url, notice: "Scan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scan
      @scan = Scan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scan_params
      params.require(:scan).permit(:title, :description, :profit_margin, :quarterly_earnings, :yearly_earnings, :user_id, :sector, :industry, :gross_profit, :net_profit, :earning_power, :return_on_assets, :return_on_equity, :debt_ratio, :debt_to_equity, :equity_multiplier, :market_to_debt, :liabilities_to_assets, :interest_coverage, :debt_service_coverage, :ratings_mean, :ratings_median, :current_ratio, :acid_test, :cash_ratio, :operating_cash_ratio, :inventory_turnover, :days_sales_outstanding, :receivables_turnover, :fixed_assets_turnover, :total_assets_turnover, :price_to_earnings, :market_to_book_value, :dividends_per_share, :dividend_payout, :dividend_yield, :altman_z_score, :piotroski_f_score)
    end
end
