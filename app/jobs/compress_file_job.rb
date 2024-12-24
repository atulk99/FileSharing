class CompressFileJob < ApplicationJob
  queue_as :default

  def perform(file_upload_id)
    file_upload = FileUpload.find(file_upload_id)

    # Download original file
    original_file = file_upload.file.download

    # Compress the file
    compressed_file_path = Rails.root.join('tmp', "#{file_upload.id}_compressed.zip")
    Zip::File.open(compressed_file_path, Zip::File::CREATE) do |zipfile|
      zipfile.add(file_upload.file.filename.to_s, StringIO.new(original_file))
    end

    # Attach compressed file to Active Storage
    file_upload.file.attach(
      io: File.open(compressed_file_path),
      filename: "#{file_upload.file.filename.base}_compressed.zip",
      content_type: 'application/zip'
    )

    # Clean up temporary file
    File.delete(compressed_file_path) if File.exist?(compressed_file_path)
  end
end


app/views/file_uploads/new.html.erb: