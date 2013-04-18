class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :miniprofiler
  
  private
  def miniprofiler
    unless current_user.nil?
    if current_user.has_role?("admin")
    logger.info 'Profiling'
    Rack::MiniProfiler.authorize_request
    # Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore
    end
  end
  end
  
end