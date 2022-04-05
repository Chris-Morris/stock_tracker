class StockListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /stock_lists or /stock_lists.json
  def index
    if user_signed_in?
      @stock_lists = StockList.where(user_id: current_user.id)
    else
      @stock_lists = StockList.all
    end
  end

  # GET /stock_lists/1 or /stock_lists/1.json
  def show
  end

  # GET /stock_lists/new
  def new
    @stock_list = StockList.new
  end

  # GET /stock_lists/1/edit
  def edit
  end

  # POST /stock_lists or /stock_lists.json
  def create
    @stock_list = StockList.new(stock_list_params)
    @stock_list.user_id = current_user.id

    respond_to do |format|
      if @stock_list.save
        format.html { redirect_to stock_list_url(@stock_list), notice: "stock_list was successfully created." }
        format.json { render :show, status: :created, location: @stock_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_lists/1 or /stock_lists/1.json
  def update
    respond_to do |format|
      if @stock_list.update(stock_list_params)
        format.html { redirect_to stock_list_url(@stock_list), notice: "stock_list was successfully updated." }
        format.json { render :show, status: :ok, location: @stock_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_lists/1 or /stock_lists/1.json
  def destroy
    @stock_list.destroy

    respond_to do |format|
      format.html { redirect_to stock_lists_url, notice: "stock_list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @stock_list = StockList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_list_params
      params.require(:stock_list).permit(:title, :description, :profit_margin, :quarterly_earnings, :yearly_earnings, :user_id)
    end
end
