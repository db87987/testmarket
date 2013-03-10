Testmarket::Application.routes.draw do

  mount Spree::Core::Engine, :at => '/'

  Spree::Core::Engine.routes.prepend do
  
    namespace :admin do
      resources :pricelist do
        get :show
        post :load
      end
    end

    match '/admin', :to => 'admin/orders#index', :as => :admin
  end
  
end
