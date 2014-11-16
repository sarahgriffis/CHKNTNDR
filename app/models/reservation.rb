class Reservation < ActiveRecord::Base
  before_save :set_location

  #before_save :find_by_foursquare

  belongs_to :user
  has_and_belongs_to_many :restaurants
  has_many :messages
  #method here

  def find_by_foursquare
    #Rails.cache.fetch lat_long do
      foursquare_data = FoursquareClient.explore_venues(:ll => lat_long, :section => 'food', :price => '3,4', :venuePhotos => true)
    #end
    Restaurant.from_foursquare(foursquare_data)
  end

  def find_matches
    #find location (lat lon)
    #time period (one day, two day overlap)
   @matches = Reservation.find_by_sql(["SELECT * FROM reservations WHERE latitude = ? AND longitude = ?
                                       AND( (preferred_date_start , preferred_date_end) OVERLAPS
                                             (?, ?))
                                       AND user_id <> ?
                                       AND inactived_at IS NULL",
                            self.latitude,
                            self.longitude,
                            self.preferred_date_start,
                            self.preferred_date_end,
                            self.user_id])


    #restaurants
    #drinks
    #time of reservation
  end


  private

  def set_location
    return false unless city.present?
    self.latitude, self.longitude = Geocoder.coordinates(self.city)
  end

  def lat_long
    "#{latitude},#{longitude}"
  end

end

