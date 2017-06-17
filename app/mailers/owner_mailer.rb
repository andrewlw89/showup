class OwnerMailer < ApplicationMailer

	def new_event_mail(event)
		@venue = event.venue
		@event = event
		@url = 'localhost:3000/venues'
		mail(to: @venue.owner.email, subject: 'Someone has created a new event at one of your venues!')
	end
end
