require 'rails_helper'

RSpec.describe "exchange_rates/index", type: :view do
  before(:each) do
    assign(:exchange_rates, [
      ExchangeRate.create!(
        from_currency: "SDN",
        to_currency: "AYN",
        amount: 2.5
      ),
      ExchangeRate.create!(
        from_currency: "AYN",
        to_currency: "SDN",
        amount: 0.4
      )
    ])
  end

  xit "renders a list of exchange_rates" do
    render
    assert_select "div>p", text: "From Currency: SDN", count: 2
    assert_select "div>p", text: "AYN", count: 2
    assert_select "div>p", text: "2.5", count: 1
    assert_select "div>p", text: "0.4", count: 1
  end
end
