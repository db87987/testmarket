Testmarket::Application.routes.draw do

  mount Spree::Core::Engine, :at => '/'



  namespace :admin do
    resources :pricelist do
      get :upload
      post :load
    end
  end
  


  Spree::Core::Engine.routes.prepend do
    match '/admin', :to => 'admin/orders#index', :as => :admin
  end
  
  
  
end
