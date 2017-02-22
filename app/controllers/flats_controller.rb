class FlatsController < ApplicationController
  def index
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
  end

  def new
    @flat = Flat.new
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

    params.require(:flat).permit(:title, :desc, :capacity, :room_number, :bed_number, :bathroom_number, :price_night, :city, :address )
  end
end
