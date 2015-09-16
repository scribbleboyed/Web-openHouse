class SessionsController < ApplicationController

	def index
		
	end

	def new
		@agent = Agent.find_by(email: params[:agent][:email]).try(:authenticate, params[:agent][:password])
		if @agent
	  		session[:user_id] = @agent.id
	  		flash[:success] = "Welcome " + @agent.first_name + "!"
	  		redirect_to agent_path
	  	else
	  		flash[:error] = "Email or password is incorrect."
	  		redirect_to root_path
	  	end
	end

	def create
	  	@agent = Agent.new(agent_params)
	  	if @agent.save
	  		flash[:success] = "User " + @agent.first_name + " created.  Please log in."
	  		redirect_to agent_path
	  	else
	      flash[:error] = "User could not be created."
	  		redirect_to root_path
	  	end
  	end

	  def destroy
	  	reset_session
	  	redirect_to root_path
	  end

  def agent_params
      params.require(:agent).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation)
  end


end
