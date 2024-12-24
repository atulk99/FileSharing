class FileUploadsController < ApplicationController
  before_action :authenticate_user!, except: [:public_show]

  def index
    @file_uploads = current_user.file_uploads
  end

  def new
    @file_upload = FileUpload.new
  end

  def show
    # binding.pry
    @file_upload = current_user.file_uploads.find(params[:id])
  end

  def create
    @file_upload = current_user.file_uploads.build(file_upload_params)
    if @file_upload.save
      redirect_to file_uploads_path, notice: "File uploaded successfully."
    else
      render :new
    end
  end

  def destroy
    @file_upload = current_user.file_uploads.find(params[:id])
    @file_upload.destroy
    redirect_to file_uploads_path, notice: "File deleted successfully."
  end

  # Add this method for public file access
  # def public_show
  #   @file_upload = FileUpload.find_by(public_token: params[:public_token])
  #   if @file_upload
  #     redirect_to rails_blob_path(@file_upload.file, disposition: "attachment")
  #   else
  #     render plain: "File not found", status: :not_found
  #   end
  # end

  def public_show
    @file_upload = FileUpload.find_by(public_token: params[:public_token])
    if @file_upload
      render :public_show # Render a custom view
    else
      render plain: "File not found", status: :not_found
    end
  end


  private

  def file_upload_params
    params.require(:file_upload).permit(:title, :description, :file)
  end
end
