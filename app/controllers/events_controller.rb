class EventsController < ApplicationController

  before_action :load_venue

	def new
   		@event = @venue.events.build
  end

	def create
		@event = @venue.events.create(event_params)
		if @event.save
   			redirect_to venue_path(@venue)
   		else
   			render :action => 'new'
   		end 
	end

	def show
   		@event = @venue.events.find(params[:id])
  end

  def edit
   		@event = @venue.events.find(params[:id])
  end
   
 	def update
 		@event = @venue.events.find(params[:id])

 		if @event.update_attributes(event_params)
 			redirect_to :action => 'show', :id => @event
 		else
 			render :action => 'edit'
 		end
  end
   
  def destroy
    @venue.events.find(params[:id]).destroy
    redirect_to venue_path(@venue)
  end

	private

		def event_params
			params.require(:event).permit(:name, :artist, :date, :cost)
	  end

    def load_venue
      @venue = Venue.find(params[:venue_id])
    end

end