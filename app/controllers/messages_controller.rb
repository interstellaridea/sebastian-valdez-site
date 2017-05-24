class MessagesController < ApplicationController

	def new
		@message = Message.new
	end

	def create
		@message = Message.new message_params
		if @message.valid?
			flash[:notice] = 'Your message was successfully sent!'
			redirect_to '/'
		else
			render :new
		end
	end

	private

	def message_params
		params.require(:message).permit(:name, :email, :body)
	end

end
