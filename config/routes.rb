Rails.application.routes.draw do
  resources :users
  devise_for :owners, :controllers => { registrations: 'registrations' }
  root to: "venues#index"
  
  resources :venues do
    resources :events do
      put :like, on: :member
    end
    collection do
      get :myvenues
    end
  end
end
