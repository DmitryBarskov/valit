require 'rails_helper'

RSpec.describe "exchange_rates/new", type: :view do
  before(:each) do
    assign(:exchange_rate, ExchangeRate.new(
      from_currency: "MyString",
      to_currency: "MyString",
      amount: 1.5
    ))
  end

  it "renders new exchange_rate form" do
    render

    assert_select "form[action=?][method=?]", exchange_rates_path, "post" do

      assert_select "input[name=?]", "exchange_rate[from_currency]"

      assert_select "input[name=?]", "exchange_rate[to_currency]"

      assert_select "input[name=?]", "exchange_rate[amount]"
    end
  end
end
