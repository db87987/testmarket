Testmarket::Application.routes.draw do

  mount Spree::Core::Engine, :at => '/'

  Spree::Core::Engine.routes.prepend do
  
  match '/admin/products/pricelist' => 'admin/pricelist#show', :as => 'show', :via => :get
  match '/admin/products/load' => 'admin/pricelist#load', :as => 'load', :via => :post

  match '/admin', :to => 'admin/orders#index', :as => :admin
  end
  

  
end
