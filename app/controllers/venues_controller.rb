class VenuesController < ApplicationController
	
   def index
		@venues = Venue.all
   end
   
   def myvenues
      @venues = current_owner.venues
   end

   def show
   	@venue = Venue.find(params[:id])
   end
   
   def new
   	@venue = Venue.new
   end
   
   def create
   	@venue = Venue.new(venue_params)
      @venue.owner = current_owner
   	if @venue.save
   		redirect_to :action => 'myvenues'
   	else
   		render :action => 'new'
   	end
   end

   def venue_params
   	params.require(:venue).permit(:name, :address, :city, :state, :photo)
   end
   
   def edit
   	@venue = Venue.find(params[:id])
   end
   
   def update
   	@venue = Venue.find(params[:id])

   	if @venue.update_attributes(venue_params)
   		redirect_to :action => 'show', :id => @venue
   	else
   		render :action => 'edit'
   	end
   end
   
   def destroy
    Venue.find(params[:id]).destroy
    redirect_to :action => 'myvenues'
   end

end
