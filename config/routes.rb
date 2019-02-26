Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: :show
    resource :kind, only: :show, path: 'relationships/kind'

    resource :phone, only: %i[create update destroy]
    resource :phone, only: %i[create update destroy], path: 'relationships/phone'

    resource :phones, only: :show
    resource :phones, only: :show, path: 'relationships/phones'

    resource :address, except: %i[new edit]
    resource :address, except: %i[new edit], path: 'relationships/address'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
