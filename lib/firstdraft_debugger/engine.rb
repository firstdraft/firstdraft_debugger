module FirstdraftDebugger
  class Engine < ::Rails::Engine
    isolate_namespace FirstdraftDebugger

    initializer "firstdraft_debugger.configure_rails_initialization" do |app|
      if enable?
        insert_middleware
      end
    end

    def insert_middleware
      if defined? BetterErrors::Middleware
        app.middleware.insert_after BetterErrors::Middleware, FirstdraftDebugger::Middleware
      else
        app.middleware.use FirstdraftDebugger::Middleware
      end
    end


    def enable?
      !Rails.env.production? and app.config.consider_all_requests_local
    end

    def app
      Rails.application
    end
  end
end
