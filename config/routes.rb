Rails.application.routes.draw do
root to: "top#top"

#admin_item
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update,]
    resources :customers
    resources :genres, only: [:index, :create, :edit, :update]
  end


namespace :public do
  get 'homes/about'
  get "item_top" => 'items#top'
  resources :items, only: [:index,:show,:new]
  resources :delivery, only: [:index, :create, :edit, :update, :destroy]
  resources :cart_items, only: [:index, :create, :update, :destroy] do
   collection do
     delete 'all_destroy'
     end
   end
# カスタマーのルート
resource :customers, module: 'public', only: [:edit, :update] do
    get "my_page" => "customers#show"
    get "unsubscribe"
    patch "withdraw"
end


# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


end
