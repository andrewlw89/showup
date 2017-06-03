module VenueHelper
	def google_map(venue)
		address = venue.address.gsub(/\s+/, "+")
		city = venue.city.gsub(/\s+/, "")
		center = [address, city, venue.state].join(',')
      return "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
   end
end
