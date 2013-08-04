class AttachmentsController < ApplicationController
	def create
		# raise params[:attachment].inspect
		@attachment = Attachment.new(params[:attachment])
		Idea.find_by_id(params[:attachment][:idea_id]).owner_attachments << @attachment
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
end
