# frozen_string_literal: true

class ExchangeRatesController < ApplicationController
  before_action :set_exchange_rate, only: %i[show edit update destroy]

  # GET /exchange_rates
  def index
    @exchange_rates = ExchangeRate.all
  end

  # GET /exchange_rates/1
  def show; end

  # GET /exchange_rates/new
  def new
    @exchange_rate = ExchangeRate.new
  end

  # GET /exchange_rates/1/edit
  def edit; end

  # POST /exchange_rates
  def create
    @exchange_rate = ExchangeRate.new(exchange_rate_params)

    if @exchange_rate.save
      redirect_to @exchange_rate,
                  notice: _("Exchange rate was successfully created.")
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exchange_rates/1
  def update
    if @exchange_rate.update(exchange_rate_params)
      redirect_to @exchange_rate,
                  notice: _("Exchange rate was successfully updated.")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /exchange_rates/1
  def destroy
    @exchange_rate.destroy
    redirect_to exchange_rates_url,
                notice: _("Exchange rate was successfully destroyed.")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_exchange_rate
    @exchange_rate = ExchangeRate.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def exchange_rate_params
    params.require(:exchange_rate).permit(:from_currency, :to_currency, :amount)
  end
end