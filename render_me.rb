require "action_controller"
require "rack/mime"

require 'base64'
require 'mimemagic'

def binary?(filename)
  begin
    fm= FileMagic.new(FileMagic::MAGIC_MIME)
    !(fm.file(filename)=~ /^text\//)
  ensure
    fm.close
  end
end

def render_me
  renderer_options = {
    http_host: "localhost:8888",
    https: nil
  }
  renderer = ActionController::Base.renderer.new(renderer_options)

  catchall_path = "./public/test-logo.png"
  catchall_path = "./public/simple.html"

  encoded_content = Base64.encode64(IO.read(catchall_path))

  content_type = Rack::Mime.mime_type(File.extname(catchall_path))
  puts "content_type #{content_type}"

  binary = !MimeMagic.by_path(catchall_path).text?
  puts "binary? #{binary}"

  render_options = if binary
                     {
                       plain: "encoded_content...",
                       content_type: content_type,
                       layout: false,
                     }
                   else
                     {
                       file: catchall_path,
                       content_type: content_type
                     }
                   end

  body = nil
  # begin
    body = renderer.render(render_options)
  # rescue ActionView::Template::Error => e
  #   puts "save me"
  #   pp e.class
  # end
  pp body
end

render_me
puts "hi"