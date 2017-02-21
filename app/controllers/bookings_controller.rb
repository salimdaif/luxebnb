class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.flat = Flat.find(params[:flat_id])
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.flat = Flat.find(params[:flat_id])
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id, :user_id)
  end
end
