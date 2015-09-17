class AgentsController < ApplicationController
  def index
  	@agent = Agent.find(session[:user_id])
  	@listings = @agent.listings
  	@prospects = @agent.prospects
    @events = @agent.events
    @events << Event.where(meeting_agent: @agent.id)
    @events.flatten

    @chats = []
    ChatAgent.where(agent_id: @agent.id).each do |chatagent|
      @chats << Chat.find(chatagent.chat_id)
    end

  end

  def update
  	agent_id = session[:user_id]
    @agent = Agent.find(agent_id)
	 @agent.update_attributes(agent_params)
	redirect_to agent_path
  end

  def agent_params
  	params.require(:agent).permit(:first_name, :last_name, :phone, :email, :image_url, :website)
  end
end
