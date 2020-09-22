Rails.application.routes.draw do
  resources :bloggers
  resources :destinations
  resources :posts do
    member do
      patch :add_like
      put :add_like
  end
end
end
