module FirstdraftDebugger
  class Middleware
    def initialize(app)
      @app      = app
    end

    def call(env)
      request = Rack::Request.new(env)
      @ip = request.ip
      @app.call(env)
    rescue Exception => ex
      [200, {"Content-Type" => "text/html"}, [error_message]]
    end

    def error_message
  %Q{Uh oh! Something went wrong.

 If you are the application owner, to get a more helpful error page please run this command at a terminal prompt:

 `bin/whitelist #{@ip}`}
    end
  end
end
