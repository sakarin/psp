Psp::Application.routes.draw do


  get "configurations" => "configuration#index"

  get "logs" => "logs#index"

  get "factorysystems" => "invoices#factories"

  get "manufactures" => "manufactures#index"

  get "stocks" => "stocks#index"

  get "sents" => "sents#index"

  get "toolbar" => "products#toolbar"

  get "menu" => "dashboard#menu"

  get "newproduct" => "products#newmenu"



  get "database" => "dashboard#database"

  resources :orders do
    resources :manufactures
    resources :stocks
    resources :sents
  end

  match '/users/register/edit/:id(.:format)' => "devise/registrations#edit_user"

  match '/invoices/:id/invoice(.:format)' => "invoices#print_factory"

  match '/orders/:order_id/manufactures(.:format)' => 'manufactures#show'

  match '/orders/:order_id/stocks(.:format)' => 'stocks#show'

  match '/orders/:order_id/sents(.:format)' => 'sents#show'

  match '/order/product/:id(.:format)' => 'orders#update_product'

  match '/invoices/new/:id(.:format)' => 'invoices#new'

  match '/customers/fancy' => "customers#new_fancy"

  resources :factory_systems

  resources :invoices

  devise_for :users, :path => "users", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_up' }

  resources :users

  get "dashboard/index"

  #devise_for :users

  resources :mouths

  resources :coats

  resources :glues

  resources :pump_lines

  resources :cuts

  resources :pumps

  resources :products

  resources :customers

  resources :factories


  match ':products/:new/:product_type' => 'products#new'


  root :to => "dashboard#menu"
  #root :to => "orders#index"

end
