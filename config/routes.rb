Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

get 'admin' => 'admin/homes#top'

namespace :admin do
  resources :items,except: [:destroy]
end 

namespace :admin do 
  resources :genres,only: [:new,:index,:create,:edit,:update]
end 

namespace :admin do
  resources :customers,only: [:index,:show,:edit,:update]  
end 

namespace :admin do
  resources :orders,only: [:show,:uodate]
end 

namespace :admin do
  resources :order_details,only: [:update]
end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end 
