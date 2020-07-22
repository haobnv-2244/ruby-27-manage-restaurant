Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#index"
    namespace :admin do
      root "admin#index"
      get "/login", to: "session#new"
      resources :admin_customers
      resources :departments
      resources :dish_types
      resources :dishes
      resources :users
      resources :table_manage
      resources :book_tables, only: %i(index edit update)
      resources :orders, only: %i(index show update)
      resources :order_invoices
    end
    get "/account_activations/:id/edit", to: "account_activations#edit", as: "edit_account_activation"
    get "/login", to: "session#new"
    post "/login", to: "session#create"
    delete "/logout", to: "session#destroy"
    resources :users
    resources :dishes, only: :index
    resources :book_tables
  end
end
