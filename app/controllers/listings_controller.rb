class ListingsController < ApplicationController

	def show
		@agent = Agent.find(session[:user_id])
		@listing = Listing.find(params[:id])
		@listing_agent = @listing.agent
		@events = Event.where(listing_id: @listing.id)
	end

	def create
		listing = Listing.new(listing_params)
		listing.agent_id = session[:user_id]
		listing.save
		redirect_to agent_path
	end

	def update
       listing_id = params[:id]
       @listing = Listing.find(listing_id)

		if @listing.update_attributes(listing_params)
			redirect_to listing_path
		else
			render :show
		end
	end

	def destroy
		@event_listings = EventListing.where(listing_id: params[:id])
		@event_listings.each do |event_listing|
			event_listing.destroy
		end
		@listing = Listing.find(params[:id])
		@listing.destroy
		redirect_to agent_path
	end

	def listing_params
		params.require(:listing).permit(:address_1, :address_2, :city, :state, :zip_code, :sqft, :bed, :bath, :description, :status, :price, :image_url)
	end

end
