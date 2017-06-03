module VenueHelper
	def google_map(venue)
		center = [venue.city, venue.state].join(',')
      return "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
   end
end
