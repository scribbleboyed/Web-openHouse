class ListingsController < ApplicationController

	def show
		@listing = Listing.find(params[:id])
		@agent = @listing.agent
		@events = Event.where(listing_id: @listing.id)
	end

	def create
		listing = Listing.new(listing_params)
		listing.agent_id = session[:user_id]
		listing.save
		redirect_to agent_path
	end

	def listing_params
		params.require(:listing).permit(:address_1, :address_2, :city, :state, :zip_code, :sqft, :bed, :bath, :description, :status, :price, :image_url)
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

end
