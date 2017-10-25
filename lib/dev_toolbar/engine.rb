module DevToolbar
  class Engine < ::Rails::Engine
    isolate_namespace DevToolbar

    initializer "dev_toolbar.configure_rails_initialization" do |app|
      if enable?
        insert_middleware
      end
    end

    initializer "dev_toolbar.assets" do |app|
      Rails.application.config.assets.precompile += %w{ dev_toolbar }
      Rails.application.config.assets.paths << root.join("app", "assets", "stylesheets", "dev_toolbar")
    end

    initializer 'dev_toolbar.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper DevToolbar::DebugHelper
      end
    end

    config.after_initialize do
      path = Rails.root.join('whitelist.yml')
      if File.exist?(path)
        whitelisted_ips = YAML.load_file(path)
        whitelisted_ips.each do |ip|
          BetterErrors::Middleware.allow_ip!(ip)
        end
      end
    end

    def insert_middleware
      if defined? BetterErrors::Middleware
        app.middleware.insert_after BetterErrors::Middleware, DevToolbar::Middleware
      else
        app.middleware.use DevToolbar::Middleware
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
