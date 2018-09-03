require "rack/mime"

# Works for utf8 text files.
# TODO: Add support to public_controller for binary data like images.
# Tricky because API Gateway is not respecting the Accept header the same way as browsers.
class FilesController < ApplicationController
  layout false

  def show
    # render json: params

    public_path = Jets.root + "public"
    catchall_path = "#{public_path}/#{params[:id]}"
    if File.exist?(catchall_path)
      content_type = Rack::Mime.mime_type(File.extname(catchall_path))
      puts "content_type #{content_type.inspect}"
      render file: catchall_path, content_type: content_type

      # dont think streaming data is the answer, think encoding instead is the answer
      # send_data @material.icon, :type => 'image/png',:disposition => 'inline'
    else
      render file: "#{public_path}/404", status: 404
    end
  end
end
