Rails.application.routes.draw do

  devise_for :usuarios, skip: [:session, :password, :registration, :confirmation], controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  scope "/(:locale)", defaults: {locale: 'en'}, constraints: { locale: /en|es/ } do

    devise_for :usuarios, skip: [:omniauth_callbacks]
    get 'home/index'

    root "home#index"

  end

end
