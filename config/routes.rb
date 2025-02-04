Rails.application.routes.draw do
  root 'books#index'
  resources :books do
    member do
      get 'confirm_delete'  # Route for the confirmation page
    end
  end
end
