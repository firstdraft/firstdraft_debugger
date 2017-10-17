module FirstdraftDebugger
  module DebugHelper

    def dev_tools
      if Rails.env.development?
        render "layouts/dev_tools"
      end
    end
  end
end
