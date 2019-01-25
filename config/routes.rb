Rails.application.routes.draw do
  # scope "(:locale)", locale: /en|nl/ do
  #   get '/:locale' => 'tasks#index'
    resources :tasks
  # end
end
