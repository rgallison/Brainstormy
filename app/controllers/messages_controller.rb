class MessagesController < ApplicationController
	def index
		@messages = get_current_user.received
	end

	def create
		user = User.find_by_username(params[:message].delete("receiver"))
		if user
			params[:message][:status] = 'unread'
			params[:message][:sender] = @current_user
			if params[:message][:reply]
				# pending
			end
			@message = Message.create!(params[:message])
			@message.received<<user
			flash[:notice] = "Message was successfully sent."
			redirect_to messages_path
		else
			flash[:warning] = "There is no user with that username."
			redirect_to messages_path
		end
	end
end