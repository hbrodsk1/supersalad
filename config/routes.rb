Rails.application.routes.draw do



  get 'home', :to => 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
    root 'devise/sessions#new'
  end

  resources :users
  resources :foods

  get 'soups', :to => 'foods#soup'
  get 'salads', :to => 'foods#salad'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
