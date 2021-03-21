json.extract! portfolio, :id, :name, :buy_date, :amount, :buy_price, :note, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
