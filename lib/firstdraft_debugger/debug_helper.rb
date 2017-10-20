module DevToolbar
  module DebugHelper

    def dev_tools
      if Rails.env.development?
        render "shared/dev_tools"
      end
    end
  end
end
