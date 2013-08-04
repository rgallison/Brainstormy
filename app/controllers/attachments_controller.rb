class AttachmentsController < ApplicationController
	def create
		@attachment = Attachment.new(params[:attachment]) #create attachment object
		Idea.find_by_id(params[:attachment][:idea_id]).owner_attachments << @attachment #add attachment object to association
		if @attachment.save
			flash[:notice] = "File has been successfully uploaded."
		else
			flash[:warning] = "File has failed to upload."
			@attachment.errors.full_messages.each do |error|
				flash[:warning] += " " + error
			end
		end
		redirect_to edit_idea_path(@attachment.idea_id)
	end

	def destroy
		# raise params.inspect
		@attachment = Attachment.find_by_id(params[:id]) #get the attachment object
		@idea = Idea.find_by_id(@attachment.idea_id) #get the idea that parents it
		@idea.owner_attachments.find(params[:id]).attachment = nil #Removes the attachment from storage
		@idea.owner_attachments.destroy(@attachment) #remove the attachment object from association
		@attachment.destroy #destroy attachment object
		redirect_to edit_idea_path(@idea)
	end
end
