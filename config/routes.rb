Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  get 'items' => 'items#index'
  get 'items/search' => 'items#search'
  get   'items/:id/show0'  => 'items#show0'
  patch 'items/:id/maketag'  => 'items#maketag'
  # post  'items/:id/create' => 'items#create'
  # 上はどうだろう？アイディを含める
  # post  'items/create' => 'items#create'
  get   'items/:id/show'  => 'items#show'
  get  'items/:dl_id/download' => 'items#download'
  get 'items/not_found' => 'items#not_found'
  get 'items/terms_conditions' => 'items#terms_conditions'
  get 'items/privacy' => 'items#privacy'
  
  
  get 'inquiries' => 'inquiries#index'              # 入力画面
  post 'inquiries/confirm' => 'inquiries#confirm'   # 確認画面
  post 'inquiries/thanks' => 'inquiries#thanks'    # 送信完了画面
  
  get '/sitemap' => redirect('https://s3-ap-northeast-1.amazonaws.com/kage-raw/sitemaps/sitemap.xml.gz')  # サイトマップをＳ３に

end
