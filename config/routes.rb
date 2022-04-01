Rails.application.routes.draw do
   root to: 'public/homes#top'
   post 'customers/confirm' => 'public/customers#confirm'
   patch 'cutomers/withdraw' => 'public/customers#withdraw'
   delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
   get 'orders/thanks' => 'public/orders#thanks'
   get 'about' => 'public/homes#about'
   
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
  resources :customers,only: [:show, :edit,:update]
end 

scope module: :public do
  resources :cart_items,only:[:index,:update,:destroy,:create]
end 

scope module: :public do
  resources :orders, only:[:new,:show,:index,:create]
end

scope module: :public do
  resources :addresses, except:[:new,:show]
end 

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
