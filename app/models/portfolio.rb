class Portfolio < ApplicationRecord

    belongs_to :user

    #def self.check_db(ticker_symbol)
    #    where(ticker: ticker_symbol).first
    #end        TODO referenced to controller 
    # may need to add new associations #271


#test logic    
     def pps
        3
     end
end

#module