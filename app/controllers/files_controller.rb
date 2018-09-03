require "rack/mime"
require "mimemagic"

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
      binary = !MimeMagic.by_path(catchall_path).text?
      puts "content_type #{content_type.inspect}"
      puts "binary #{binary}"

      if binary
        encoded_content = Base64.encode64(IO.read(catchall_path))
        # encoded_content = "encoded_content.."
        render plain: encoded_content, content_type: content_type
      else
        render file: catchall_path, content_type: content_type
      end
    else
      render file: "#{public_path}/404", status: 404
    end
  end
end
