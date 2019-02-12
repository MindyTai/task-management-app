Rails.application.routes.draw do
  controller :sessions do
    get 'login' => :index
    post 'login' => :create
    delete 'logout' => :destroy
    get 'signup' => :signup_index
    post 'signup' => :signup
  end
  resources :tasks
  
  controller :tasks do
    get 'tags/:tag_ids' => :show, as: :tag_ids
  end

  namespace :admin do
    resources :admin_users
    resources :users
  end

  controller :errors do
    get "*path" => :index
  end

end
