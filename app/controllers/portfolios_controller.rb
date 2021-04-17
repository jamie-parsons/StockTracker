class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]  #if a user is not authenticated, then only let them see index page and show page 
  before_action :correct_user, only: [:edit, :show, :update, :destroy] #for these pages, check that it is correct user


  # GET /portfolios or /portfolios.json
  def index
    @portfolios = Portfolio.all
    @iex = StockQuote::Stock.new(api_key: ENV['IEX_API'])
    #@stock = StockQuote::Stock.quote([:name])

    #"print #{@stock}"
   
   
   # @iex = ENV['IEX_API'] #referencing IEX API as of stock_quote gem 3.0
   # @stock = StockQuote::Stock.quote("#{portfolio.name}")
  end

  def Stocking
    "Hi I have an #{@stock}" 
  end

  # GET /portfolios/1 or /portfolios/1.json
  def show
  end

  # GET /portfolios/new
  def new
    #@portfolio = Portfolio.new
    @portfolio = current_user.portfolios.build

  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios or /portfolios.json
  def create
    #@portfolio = Portfolio.new(portfolio_params)
    @portfolio = current_user.portfolios.build(portfolio_params)



    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: "Portfolio was successfully created." }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1 or /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: "Portfolio was successfully updated." }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1 or /portfolios/1.json
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Portfolio was successfully removed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @portfolio = current_user.portfolios.find_by(id: params[:id])
    redirect_to portfolios_path, notice: "Oops! Here are your holdings" if @portfolio.nil? #2 58
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_params
      params.require(:portfolio).permit(:name, :buy_date, :amount, :buy_price, :note, :user_id)
    end
end
