class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authorize
    if current_user.has_spree_role?("admin")
      Rack::MiniProfiler.authorize_request
      Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore
    end
  end
  
end
