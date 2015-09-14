class EventsController < ApplicationController

	def create
		event = Event.new(event_params)
		event.save
		redirect_to agent_path
	end

	def event_params
		params.require(:event).permit(:event_type, :title, :date, :start_time, :end_time, :agent_id, :listing_id, :prospect_id)
	end


end
