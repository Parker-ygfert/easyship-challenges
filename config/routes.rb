Rails.application.routes.draw do
  resources :companies, only: [] do
    resources :shipments, only: %i[index show]
  end
end
