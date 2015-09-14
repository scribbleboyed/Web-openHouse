class AgentsController < ApplicationController
  def index
  	@agent = Agent.find(session[:user_id])
  	@listings = @agent.listings
  	@prospects = @agent.prospects
  	@open_houses = @agent.open_houses
  	@eventagents = EventAgent.where(agent_id: @agent.id)
  	@events = []
  	@eventagents.each do |eventagent|
  		@events << Event.find(eventagent.event_id)
  	end
  end
end
