class EventsController < ApplicationController

	def new
   		@venue = Venue.find(params[:venue_id])
   		@event = @venue.events.build
   		# respond_to do |format|
     #  		format.html # new.html.erb
     #  		format.xml  { render :xml => @event }
    	# end
   	end

	def create
		venue = Venue.find(params[:venue_id])
		@event = venue.events.create(event_params)
		if @event.save
   			redirect_to venue_path(venue)
   		else
   			render :action => 'new'
   		end 
	end

	private
		def event_params
			params.require(:event).permit(:name, :artist, :date, :cost)
		end

end