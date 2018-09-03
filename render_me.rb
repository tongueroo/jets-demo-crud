require "action_controller"
require "rack/mime"

def render_me
  renderer_options = {
    http_host: "localhost:8888",
    https: nil
  }
  renderer = ActionController::Base.renderer.new(renderer_options)

  catchall_path = "./public/test-logo.png"
  # catchall_path = "./public/simple.html"
  content_type = Rack::Mime.mime_type(File.extname(catchall_path))
  render_options = {
    file: catchall_path,
    content_type: content_type
  }
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