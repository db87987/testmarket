class ApplicationController < ActionController::Base
  protect_from_forgery

      Rack::MiniProfiler.authorize_request
      Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore

  
end
