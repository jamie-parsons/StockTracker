class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.date :buy_date
      t.float :amount
      t.float :buy_price
      t.text :note

      t.timestamps
    end
  end
end
