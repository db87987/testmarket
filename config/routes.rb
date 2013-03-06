Testmarket::Application.routes.draw do

  mount Spree::Core::Engine, :at => '/'

  

  Spree::Core::Engine.routes.prepend do
    match '/admin', :to => 'admin/orders#index', :as => :admin
  end
  
  
  
end
