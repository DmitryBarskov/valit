class CreateExchangeRates < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_rates do |t|
      t.string :from_currency
      t.string :to_currency
      t.float :amount

      t.timestamps
    end
  end
end
