class Portfolio < ApplicationRecord

    belongs_to :user

    #def self.check_db(ticker_symbol)
    #    where(ticker: ticker_symbol).first
    #end        TODO referenced to controller 
    # may need to add new associations #271


#test logic    
     def pps
        stock = StockQuote::Stock.quote("#{portfolio.name}")
        number_with_precision(stock.latest_price, :precision => 2, :delimiter => ",")
     end
end

#module

#try putting here first. Can try breaking out into separate module later
#logic to be called to calculate profit/loss