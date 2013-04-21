class MessagesController < ApplicationController
	def index
		@messages = get_current_user.messages
	end
end