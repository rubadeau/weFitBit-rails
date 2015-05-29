Rails.application.routes.draw do

   root 'welcome#index'

   get 'sign_up', to: 'registrations#new'
   post 'sign_up', to: 'registrations#create'
   get 'sign-in', to: 'authentications#new'
   post 'sign-in', to: 'authentications#create'

   resources :challenges

end
