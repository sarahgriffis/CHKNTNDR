module ReservationsHelper
  def reservation_labels(r)
    "<div class='restaurant-label'> #{r.name.capitalize}
     <br>
     Price tier: #{r.price} of 5.
     <br>
     Rating:  #{r.rating} from #{r.number_of_ratings} #{'rating'.pluralize}.
     <br>
     <img src=#{r.photo_url} >
     <br>
     #{r.formatted_address}
     <br>
     #{r.formatted_phone} </div>"
  end
end
