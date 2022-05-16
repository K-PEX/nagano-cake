Rails.application.routes.draw do
  
  namespace :admin do
    get 'costomers/index'
    get 'costomers/show'
    get 'costomers/edit'
  end
  namespace :public do
    get 'homes/about'
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
