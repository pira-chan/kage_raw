Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  get 'items' => 'items#index'
  get 'items/new' => 'items#new'
  
  get 'items/search' => 'items#search'
  get   'items/:id/management'  => 'items#management'
  get   'items/data_list'  => 'items#data_list'
  patch   'items/:id/tag_addition'  => 'items#tag_addition'
  get   'items/:id/pre_show'  => 'items#pre_show'
  post 'items' => 'items#create'
  patch 'items/:id/maketag'  => 'items#maketag'
  # post  'items/:id/create' => 'items#create'
  # 上はどうだろう？アイディを含める
  # post  'items/create' => 'items#create'

  delete 'tags/:id'  => 'tags#destroy'
  get   'items/:id/show'  => 'items#show'
  get  'items/:id/download' => 'items#download'
  get 'items/not_found' => 'items#not_found'
  get 'items/terms_conditions' => 'items#terms_conditions'
  get 'items/privacy' => 'items#privacy'
  
  get 'users/:id' => 'users#mypage'
  
  
  get 'inquiries' => 'inquiries#index'              # お問い合わせ入力画面
  post 'inquiries/confirm' => 'inquiries#confirm'   # お問い合わせ確認画面
  post 'inquiries/thanks' => 'inquiries#thanks'    # お問い合わせ送信完了画面
  
  get '/sitemap' => redirect('https://s3-ap-northeast-1.amazonaws.com/kage-raw/sitemaps/sitemap.xml.gz')  # サイトマップをＳ３に

end
