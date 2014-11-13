class Reservation < ActiveRecord::Base
  before_save :set_location

  #before_save :find_by_foursquare

  belongs_to :user
  has_and_belongs_to_many :restaurants
  #method here

  def find_by_foursquare
    #Rails.cache.fetch lat_long do
      foursquare_data = FoursquareClient.explore_venues(:ll => lat_long, :query => self.cuisine, :venuePhotos => true)
    #end
    Restaurant.from_foursquare(foursquare_data)
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

