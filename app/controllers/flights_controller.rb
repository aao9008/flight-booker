class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @available_dates = Flight.order(:start_datetime).pluck(:start_datetime).map { |dt| dt.to_date }.uniq
    @flights = []

    if params[:departure_airport].present? && params[:arrival_airport].present? && params[:start_datetime].present? && params[:passengers].present?
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport],
        arrival_airport_id: params[:arrival_airport],
        start_datetime: DateTime.parse(params[:start_datetime]).all_day
      )
    end
  end
end
