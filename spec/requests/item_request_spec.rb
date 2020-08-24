require "rails_helper"

RSpec.describe "Items", type: :request do
  describe 'Get #index'do
    before do
      get '/'
    end
    example "リクエストは200 OKとなること" do
      expect(response.status).to eq 200
    end
    example "正常なレスポンスとなること" do
      expect(response).to be_successful
    end    
  end
  
  describe 'Get #pre_show'do
    before do
      @selected_item = Item.create(
        id: 1,
        title: "テスト",
        cr_item: "https://kage-raw.s3-ap-northeast-1.amazonaws.com/CR_%E9%81%A0%E3%81%8F%E3%82%92%E7%9C%BA%E3%82%81%E3%82%8B%E7%94%B7.png",
        dl_item: "https://kage-raw.s3-ap-northeast-1.amazonaws.com/%EF%BC%92%E9%81%A0%E3%81%8F%E3%82%92%E7%9C%BA%E3%82%81%E3%82%8B%E7%94%B7.png"
        )
    end
    example "リクエストは200 OKとなること" do
      get '/items/1/pre_show'
      expect(response.status).to eq 200
    end
    example "正常なレスポンスとなること" do
      get '/items/1/pre_show'
      expect(response).to be_successful
    end    
  end  
  
    describe 'Post #maketag'do
    before do
      @selected_item = Item.create(
        id: 1,
        title: "テスト",
        cr_item: "https://kage-raw.s3-ap-northeast-1.amazonaws.com/CR_%E9%81%A0%E3%81%8F%E3%82%92%E7%9C%BA%E3%82%81%E3%82%8B%E7%94%B7.png",
        dl_item: "https://kage-raw.s3-ap-northeast-1.amazonaws.com/%EF%BC%92%E9%81%A0%E3%81%8F%E3%82%92%E7%9C%BA%E3%82%81%E3%82%8B%E7%94%B7.png"
        )
      # @selected_item.suggests.suggest_tag = ""
    end
    example "提案タグが空欄の場合は保存できないこと" do
      # get '/items/1/pre_show'
      patch '/items/1/maketag'
      @selected_item.suggests.build(suggest_tag: "", item_title: @selected_item.title)
     
      # assert_template '/items/1/pre_show'
      # expect(flash[:alert]).to include("20文字以内のタグを入力して下さい！")
      # expect(response).to render_template("pre_show")
      expect(response.body).to include("20文字以内のタグを入力して下さい！")
    end
    end  
  
end
