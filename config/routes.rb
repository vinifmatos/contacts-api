Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # resources :auths, only: %i[create]
  resources :kinds
  api_version(:module => "V1", :header => {:name => "X-Version", :value => "1"}) do
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
  end
  api_version(:module => "V2", :header => {:name => "X-Version", :value => "2"}) do
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
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
