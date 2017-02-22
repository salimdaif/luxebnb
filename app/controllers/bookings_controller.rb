class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.flat = Flat.find(params[:flat_id])
  end

  def create
    @booking = current_user.bookings.new(bookings_params)
    @booking.flat = Flat.find(params[:flat_id])

    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(bookings_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id, :user_id, :service_ids => [])
  end
end
