class ReservationsController < ApplicationController
  def index
  end

  def new
    @reservation = Reservation.new
  end



  def show
    @reservation = Reservation.find(params[:id])
    #@restaurants = @reservation.restaurants
  end

  def create
    @reservation = Reservation.new(reservation_params, user: current_user)

    if @reservation.save
      flash[:notice] = nil #TODO you shouldn't have to do this
      redirect_to edit_reservation_path(@reservation.id)
      #redirect_to find_restaurants_path(@reservation.id)
    else
      flash[:notice] = 'Could not find any restaurants'
      render :new
    end

  end

  #not using this method
  #def find_restaurants
  #  @reservation = Reservation.find_by(id: params[:id])
  #  @restaurants = @reservation.find_by_foursquare
  #end

  def edit
    @reservation = Reservation.find(params[:id])
    @restaurants = @reservation.find_by_foursquare
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(reservation_params)
      redirect_to @reservation
    else
      render :edit
    end
  end

private

  def reservation_params
    params.require(:reservation).permit(:city, :fav_restaurant1, :fav_restaurant2, :fav_restaurant3,
                                       :cuisine, :prefer_drinks, :preferred_reservation_time,
                                       :preferred_date, :user_id)
  end


end
