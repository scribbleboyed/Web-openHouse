class EventsController < ApplicationController

	def create
		event = Event.new(event_params)
		event.agent_id = session[:user_id]
		event.save

		if params[:agents][0] != ""
			sel_agent_ids = params[:agents]
			sel_agent_ids.each do |agent_id|
				eventagent = EventAgent.new(event_id: event.id, agent_id: agent_id)
				eventagent.save
			end
		end

		if params[:listings][0] != ""
			sel_listing_ids = params[:listings]
			sel_listing_ids.each do |listing_id|
				eventlisting = EventListing.new(event_id: event.id, listing_id: listing_id)
				eventlisting.save
			end
		end

		if params[:prospects][0] != ""
			sel_prospect_ids = params[:prospects]
			sel_prospect_ids.each do |prospect_id|
				eventprospect = EventProspect.new(event_id: event.id, prospect_id: prospect_id)
				eventprospect.save
			end
		end

		redirect_to agent_path

	end

	def show
		@agent = Agent.find(session[:user_id])
		event_id = params[:id]
		@event = Event.find(event_id)

		@agents = []
		@eventagents = EventAgent.where(event_id: event_id)
		@eventagents.each do |eventagent|
			@agents << Agent.find(eventagent.agent_id)
		end

		@listings = []
		@eventlistings = EventListing.where(event_id: event_id)
		@eventlistings.each do |eventlisting|
			@listings << Listing.find(eventlisting.listing_id)
		end

		@prospects = []
		@eventprospects = EventProspect.where(event_id: event_id)
		@eventprospects.each do |eventprospect|
			@prospects << Prospect.find(eventprospect.prospect_id)
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
		params.require(:event).permit(:event_type, :title, :date, :start_time, :end_time, :meeting_agent, :listing_id, :prospect_id, :notes)
	end


end
