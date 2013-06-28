class AttachmentController < ApplicationController
  def index
  end

  def edit
    @attachment=Attachment.find(params[:id])
  end
end
