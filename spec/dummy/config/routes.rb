Rails.application.routes.draw do
  mount FirstdraftDebugger::Engine => "/firstdraft_debugger"
end
