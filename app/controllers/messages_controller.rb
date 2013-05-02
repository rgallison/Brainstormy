class MessagesController < ApplicationController
	def index
		@messages = get_messages
	end

	def create
		user = User.find_by_username(params[:message][:receiver])#remove receiver and give it a varibale -rg 4/29
		if user ||= User.find_by_id(params[:message][:receiver])#valid entry -rg 4/29
			params[:message].delete('receiver')
			params[:message][:status] = 'unread'#set status -rg 4/29
			params[:message][:sender] = @current_user#set sender -rg 4/29
			# raise params.inspect
			@message = Message.create!(params[:message])#create message! -rg 4/29
			if parent = params[:message][:parent_id]#checks if this is a reply to another message -rg 4/29
				Message.find_by_id(parent).update_attributes(:child_id => @message.id)#updates parent message to have this message as child -rg 4/29
			end
			@message.received<<user#adds receiver to database
			flash[:notice] = "Message was successfully sent."
			redirect_to messages_path
		else
			flash[:warning] = "There is no user with that username."
			redirect_to messages_path
		end
	end

	def show
		@messages = get_messages
		@message = Message.find_by_id(params[:id])
		@message.update_attributes(:status => 'read')
		render 'index'
	end
end