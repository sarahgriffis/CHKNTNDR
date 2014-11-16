module ReservationsHelper
  def reservation_labels(r)
    "<div class='restaurant-label'>
     <p  class='justify restauranttext'>#{r.name.capitalize}</p>
     Price tier: #{r.price} of 5.
     <br>
     Rating:  #{r.rating} from #{r.number_of_ratings} #{'rating'.pluralize}.
     <br>
     <img src=#{r.photo_url}>
     <br>
     <p class='justify restauranttext'>#{r.formatted_address}</p>
     #{r.formatted_phone}
     <hr>
     </div>"
  end
end
