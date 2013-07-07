class AttachmentsController < ApplicationController
  def index
    @pictures = Picture.all
    render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    @attachment = Attachment.new(params[:picture])
    if @attachment.save
      respond_to do |format|
        format.html {  
          render :json => [@attachment.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@attachment.to_jq_upload].to_json			
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def edit
    @attachment=Attachment.find(params[:id])
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    render :json => true
  end

end


