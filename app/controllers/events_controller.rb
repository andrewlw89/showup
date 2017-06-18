class EventsController < ApplicationController

  before_action :load_venue

	def new
   		@event = @venue.events.build
  end

	def create
		
		respond_to do |format|
      if @event = @venue.events.create(event_params)
        OwnerMailer.new_event_mail(@event).deliver_later
        format.html { redirect_to venue_path(@venue), notice: 'Event was successfully booked guy.'}
  	    format.json { render :show, status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
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

  def like
    @event = Event.find(params[:id])
    @event.liked_by current_user
    if request.xhr?
      render json: { count: @event.get_likes.size, id: params[:id] }
    else
    redirect_to :action => 'show', :id => @event
  end
    
  end

  def dislike
    @event = Event.find(params[:id])
    @event.disliked_by current_user
    if request.xhr?
      render json: { count: @event.get_likes.size, id: params[:id] }
    else
      redirect_to :action => 'show', :id => @event
    end
  end
	private

		def event_params
			params.require(:event).permit(:name, :artist, :date, :cost)
	  end

    def load_venue
      @venue = Venue.find(params[:venue_id])
    end

end