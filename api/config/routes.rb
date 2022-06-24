Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }

  ## ======= 👇 ここから変更する =======
  resources :messages, only: ['index'] do
    member do
      resources :likes, only: ['create']
    end
  end
  ## ====== 👆 ここまで変更する =======
  resources :likes, only: ['destroy']
end
