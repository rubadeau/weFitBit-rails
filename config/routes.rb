Rails.application.routes.draw do

   root 'welcome#index'

   get 'sign_up', to: 'registrations#new'
   post 'sign_up', to: 'registrations#create'

   resources :challenges

end
