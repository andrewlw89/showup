Rails.application.routes.draw do
  devise_for :users
  resources :users
  devise_for :owners, :controllers => { registrations: 'registrations' }
  root to: "venues#index"
  
  resources :venues do
    resources :events do
      member do
        put "like", to: "events#like"
        put "dislike", to: "events#dislike"
      end
    end
    collection do
      get :myvenues
      get :myvenue
    end
  end
end
