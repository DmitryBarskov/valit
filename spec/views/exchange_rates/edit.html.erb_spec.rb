require 'rails_helper'

RSpec.describe "exchange_rates/edit", type: :view do
  before(:each) do
    @exchange_rate = assign(:exchange_rate, ExchangeRate.create!(
      from_currency: "MyString",
      to_currency: "MyString",
      amount: 1.5
    ))
  end

  it "renders the edit exchange_rate form" do
    render

    assert_select "form[action=?][method=?]", exchange_rate_path(@exchange_rate), "post" do

      assert_select "input[name=?]", "exchange_rate[from_currency]"

      assert_select "input[name=?]", "exchange_rate[to_currency]"

      assert_select "input[name=?]", "exchange_rate[amount]"
    end
  end
end
