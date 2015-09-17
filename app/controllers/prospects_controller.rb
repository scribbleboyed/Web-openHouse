class ProspectsController < ApplicationController

	def show
		@agent = Agent.find(session[:user_id])
		@prospect = Prospect.find(params[:id])
		@events = []
		EventProspect.where(prospect_id: @prospect.id).each do |eventprospect|
			@events << Event.find(eventprospect.event_id)
		end
	end

	def update
       prospect_id = params[:id]
       @prospect = Prospect.find(prospect_id)

		if @prospect.update_attributes(prospect_params)
			redirect_to prospect_path
		else
			render :show
		end
	end

	def create
		prospect = Prospect.new(prospect_params)
		prospect.agent_id = session[:user_id]
		prospect.save
		redirect_to agent_path
	end

	def destroy
		@event_prospects = EventProspect.where(prospect_id: params[:id])
		@event_prospects.each do |event_prospect|
			event_prospect.destroy
		end
		@prospect = Prospect.find(params[:id])
		@prospect.destroy
		redirect_to agent_path
	end

	def prospect_params
		params.require(:prospect).permit(:first_name, :last_name, :phone, :email, :notes)
	end

end
