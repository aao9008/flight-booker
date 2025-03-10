class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight= Flight.find(params[:flight_id])
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find(@booking.flight_id)

    if @booking.save
      flash[:notice] = "Booking successfully saved!"
      redirect_to @booking
    else
      flash[:error] = "Please fix your errors."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
