class EventsController < ApplicationController

	def create
		event = Event.new(event_params)
		event.save
		redirect_to agent_path
	end

	def show
		event_id = params[:id]
		@event = Event.find(event_id)
		if @event.prospect_id
			@prospect = Prospect.find(@event.prospect_id)
		end
		if @event.listing_id
			@listing = Listing.find(@event.listing_id)
		end
	end

	def update
       event_id = params[:id]
       @event = Event.find(event_id)

		if @event.update_attributes(event_params)
			redirect_to event_path
		else
			render :show
		end
	end

	def destroy
		@event_agents = EventAgent.where(event_id: params[:id])
		@event_agents.each do |event_agent|
			event_agent.destroy
		end
		@event_prospects = EventProspect.where(event_id: params[:id])
		@event_prospects.each do |event_prospect|
			event_prospect.destroy
		end
		@event_listings = EventListing.where(event_id: params[:id])
		@event_listings.each do |event_listing|
			event_listing.destroy
		end
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to agent_path
	end

	def event_params
		params.require(:event).permit(:event_type, :title, :date, :start_time, :end_time, :agent_id, :listing_id, :prospect_id, :notes)
	end


end
