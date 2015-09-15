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

end
