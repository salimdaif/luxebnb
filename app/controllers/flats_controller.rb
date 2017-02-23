class FlatsController < ApplicationController
  def index
  @flats = Flat.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      #marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

    if params[:search]
      @flats = Flat.where("lower(city) LIKE ?", "%#{params[:search].downcase}%")
    else
      @flats = Flat.all
    end
  end

  def search

     @flats= Flat.search(params)
   end
  def show

    @flat = Flat.find(params[:id])
    @available = Availability.find_by(flat_id: @flat.id)
     # @hash = Gmaps4rails.build_markers(@flat)
     # do |flat, marker|
     #  marker.lat flat.latitude
     #  marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    # end
  end

  def new
    @flat = Flat.new
    @flat.availabilities.build
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user

    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to user_path(current_user)
  end

  private

  def flat_params

    params.require(:flat).permit(:title, :desc, :capacity, :room_number, :bed_number, :bathroom_number, :price_night, :city, :address, photos: [], availabilities_attributes: [:id, :start_date, :end_time] )
  end
end
