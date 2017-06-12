Rails.application.routes.draw do
  devise_for :owners, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'venue/list'
  # get 'venue/new'
  # post 'venue/create'
  # patch 'venue/update'
  # get 'venues/'
  # get 'venue/show'
  # get 'venue/edit'
  # get 'venue/delete'
  # get 'venue/update'
  root to: "venues#index"
  
  resources :venues do
    collection do
      get :myvenues
    end
    resources :events
  end

end
