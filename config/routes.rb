Rails.application.routes.draw do
  resources :hashtags
  root to: 'questions#index'

  resources :questions

  resources :questions do
    member do
      put :hide
    end
  end

  resource :session, only: %i[new create destroy]
  resources :users, param: :nickname, except: %i[index]
  resources :hashtags, only: %i[show]
end
