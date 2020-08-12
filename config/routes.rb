Rails.application.routes.draw do
  devise_for :users, :controllers => {
                       :registrations => "users/registrations",
                     }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"

  resources :users, :except => :show do
    resources :requests
  end
  
  get "requests/requests_list" => "requests#requests_list"
  resources :requests, only: [:show, :update]

  get "items/data_list" => "items#data_list"
  post "items/:id/tag_addition" => "items#tag_addition"   #管理者タグ編集画面（タグ新規登録）
  delete "tags/:id" => "tags#destroy" #管理者タグ編集画面（タグ削除）
  get "items/search" => "items#search"
  get "items/:id/management" => "items#management"
  get "items/:id/pre_show" => "items#pre_show"
  post "items/:id/maketag" => "items#maketag"   #ユーザーＤＬ前タグ提案
  get "items/:id/download" => "items#download"
  get "items/not_found" => "items#not_found"
  get "items/terms_conditions" => "items#terms_conditions"
  get "items/privacy" => "items#privacy"
  get "items/whats_kage_request" => "items#whats_kage_request"
  resources :items, only: [:show, :update, :index, :create, :destroy, :new]

  get "inquiries" => "inquiries#index"              # お問い合わせ入力画面
  post "inquiries/confirm" => "inquiries#confirm"   # お問い合わせ確認画面
  post "inquiries/thanks" => "inquiries#thanks"    # お問い合わせ送信完了画面

  get "/sitemap" => redirect("https://s3-ap-northeast-1.amazonaws.com/kage-raw/sitemaps/sitemap.xml.gz")  # サイトマップをＳ３に
  


end
