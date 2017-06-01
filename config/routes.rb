Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'venue/list'
  get 'venue/new'
  post 'venue/create'
  patch 'venue/update'
  get 'venue/list'
  get 'venue/show'
  get 'venue/edit'
  get 'venue/delete'
  get 'venue/update'
end
