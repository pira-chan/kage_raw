Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :requests   #実験用
  resources :users, :except => :show do
    resources :request
  end
  
  get 'items' => 'items#index'
  get 'items/new' => 'items#new'   #管理者アイテム作成画面
  post 'items' => 'items#create'   #管理者アイテム作成画面
  patch   'items/:id/tag_addition'  => 'items#tag_addition'#管理者タグ編集画面
  delete 'tags/:id'  => 'tags#destroy'#管理者タグ編集画面
  get 'items/search' => 'items#search'
  get   'items/:id/management'  => 'items#management'
  get   'items/data_list'  => 'items#data_list'
  get   'items/:id/pre_show'  => 'items#pre_show'
  # patch 'items/:id/maketag'  => 'items#maketag'
  # post  'items/:id/create' => 'items#create'
  # 上はどうだろう？アイディを含める
  # post  'items/create' => 'items#create'
  get   'items/:id/show'  => 'items#show'
  get  'items/:id/download' => 'items#download'
  get 'items/not_found' => 'items#not_found'
  get 'items/terms_conditions' => 'items#terms_conditions'
  get 'items/privacy' => 'items#privacy'
  get 'items/whats_kage_request' => 'items#whats_kage_request'
  
  get 'users/:id' => 'users#mypage'
  
  
  
  get 'inquiries' => 'inquiries#index'              # お問い合わせ入力画面
  post 'inquiries/confirm' => 'inquiries#confirm'   # お問い合わせ確認画面
  post 'inquiries/thanks' => 'inquiries#thanks'    # お問い合わせ送信完了画面
  
  get '/sitemap' => redirect('https://s3-ap-northeast-1.amazonaws.com/kage-raw/sitemaps/sitemap.xml.gz')  # サイトマップをＳ３に

end
