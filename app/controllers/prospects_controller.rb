class ProspectsController < ApplicationController

	def create
		prospect = Prospect.new(prospect_params)
		prospect.agent_id = session[:user_id]
		prospect.save
		redirect_to agent_path
	end

	def prospect_params
		params.require(:prospect).permit(:first_name, :last_name, :phone, :email, :notes)
	end

end
