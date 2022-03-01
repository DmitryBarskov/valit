# frozen_string_literal: true

require "rails_helper"

RSpec.describe "exchange_rates/show", type: :view do
  before do
    @exchange_rate = assign(:exchange_rate, ExchangeRate.create!(
                                              from_currency: "From Currency",
                                              to_currency: "To Currency",
                                              amount: 2.5
                                            ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/From Currency/)
    expect(rendered).to match(/To Currency/)
    expect(rendered).to match(/2.5/)
  end
end
