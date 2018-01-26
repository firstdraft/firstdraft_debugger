module DevToolbar
  class Engine < ::Rails::Engine
    isolate_namespace DevToolbar

    initializer "dev_toolbar.assets" do |app|
      Rails.application.config.assets.precompile += %w{ dev_toolbar }
      Rails.application.config.assets.paths << root.join("app", "assets", "stylesheets", "dev_toolbar")
    end

    initializer 'dev_toolbar.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper DevToolbar::DebugHelper
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
