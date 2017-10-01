Rails.application.routes.draw do
  get 'ping', to: 'application#ping'

  namespace :v1 do
    get 'companies', to: 'companies#index'
  end
end
