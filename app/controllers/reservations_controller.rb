class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params, user: current_user)
    @reservation.user_id = current_user.id if current_user

    if @reservation.save
      flash[:notice] = nil #TODO you shouldn't have to do this
      redirect_to edit_reservation_path(@reservation.id)
    else
      flash[:notice] = 'Could not find any restaurants'
      render :new
    end

  end

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

  def show
    @reservation = Reservation.find(params[:id])
    @restaurants = @reservation.restaurants
  end

  def index
    @reservations = current_user.reservations
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path

  end

  def find_matches
    @matches = Reservation.find(params[:id]).find_matches

  end


private

  def reservation_params
    params.require(:reservation).permit(:city, :fav_restaurant1, :fav_restaurant2, :fav_restaurant3,
                                       :cuisine, :prefer_drinks, :preferred_reservation_time,
                                       :preferred_date_start, :preferred_date_end, :user_id, {:restaurant_ids => []})
  end


end
