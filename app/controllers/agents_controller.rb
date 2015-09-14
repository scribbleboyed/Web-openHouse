class AgentsController < ApplicationController
  def index
  	@agent = Agent.find(session[:user_id])
  	@listings = @agent.listings
  	@prospects = @agent.prospects
    @events = @agent.events
  end
end
