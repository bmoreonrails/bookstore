Rails.application.routes.draw do
  resources :books do
    resources :reviews
  end

  resource :session
end
