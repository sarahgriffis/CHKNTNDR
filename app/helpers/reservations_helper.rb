module ReservationsHelper
  def reservation_labels(r)
    "<div class='restaurant-label'>
     <p  class='justify restauranttext'>#{r.name.capitalize}</p>
     Price tier: #{r.price} of 5.
     <br>
     Rating:  #{r.rating} from #{r.number_of_ratings} #{'rating'.pluralize}.
     <br>
     <img src=#{photo_url(r)}>
     <br>
     <p class='justify restauranttext'>#{r.formatted_address}</p>
     #{r.formatted_phone}
     <hr>
     </div>"
  end

  def photo_url(reservation)
    if reservation.photo_url
      reservation.photo_url
    else
      asset_path('restaurant-clip-art.jpg')
    end
  end
end
