class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :reservations

  def self.from_foursquare(response)
    response.groups.first['items'].map do |place|
      venue = place[:venue]
      restaurant = find_or_create_by(foursquare_id: venue[:id]) do |r|
        r.name = venue[:name]
        r.formatted_address = address_from_foursquare(venue[:location][:formattedAddress])
        r.formatted_phone = place[:venue][:contact][:formattedPhone]
        r.price_tier = price_from_foursquare(place[:venue][:price])
        r.rating = place[:venue][:rating]
        r.number_of_ratings = place[:venue][:ratingSignals]
        r.photo_url = photo_from_foursquare(place[:venue][:featuredPhotos])
      end
      restaurant.save
      restaurant
    end
  end

  #TODO: These methods should probably be broken out to a FoursquareResponse class
  def self.photo_from_foursquare(photos)
    return unless photos
    photo = photos[:items].first
    "#{photo[:prefix]}300x300#{photo[:suffix]}"
  end

  def self.address_from_foursquare(address)
    address.join(', ')
  end

  def self.price_from_foursquare(price)
    price.try(:tier)
  end

  #TODO: This is view logic, move to helper, presenter or decorator
  def price
    price_tier ? price_tier : 'Unknown'
  end
end

#      Restaurant.new(place[:venue][:name],
#                     place[:venue][:location][:formattedAddress].nil? ? 'Address Unknown' : place[:venue][:location][:formattedAddress],
#                     place[:venue][:contact][:formattedPhone].nil? ? 'Phone Number Unknown' : place[:venue][:contact][:formattedPhone],
#                     place[:venue][:price].nil? ? '?' : place[:venue][:price][:tier],
#                     place[:venue][:rating].nil? ? '?' : place[:venue][:rating],
#                     place[:venue][:ratingSignals].nil? ? '?' :  place[:venue][:ratingSignals],
#                     place[:venue][:featuredPhotos].nil? ? 'no picture' : place[:venue][:featuredPhotos][:items][0][:prefix] ,
#                     place[:venue][:featuredPhotos].nil? ? 'no picture' : place[:venue][:featuredPhotos][:items][0][:suffix])
