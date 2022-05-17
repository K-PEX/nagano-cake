Rails.application.routes.draw do
root to: "top#top"

namespace :admin do
  resources :customers
end

namespace :public do
  get 'homes/about'
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
