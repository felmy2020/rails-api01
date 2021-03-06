Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }

  ## ======= π γγγγε€ζ΄γγ =======
  resources :messages, only: ['index'] do
    member do
      resources :likes, only: ['create']
    end
  end
  ## ====== π γγγΎγ§ε€ζ΄γγ =======
  resources :likes, only: ['destroy']
end
