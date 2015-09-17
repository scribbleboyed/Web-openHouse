class ChatsController < ApplicationController

  def index
    @chatusers = ChatAgent.where(agent_id: session[:user_id])
    @chatusers.each do |chatuser|
    	@chats << Chat.find(chatuser.chat_id)
    end
  end

  def show
    @messages = Message.where(chat_id: session[:chat_id])
  end

  def new
    @product = Product.new
  end

  def create
    @products = Product.all
    @product = Product.create(product_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @products = Product.all
    @product = Product.find(params[:id])
    
    @product.update_attributes(product_params)
  end

  def delete
    @product = Product.find(params[:product_id])
  end

  def destroy
    @products = Product.all
    @product = Product.find(params[:id])
    @product.destroy
  end

private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end

end
