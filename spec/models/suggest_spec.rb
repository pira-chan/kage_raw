require "rails_helper"

RSpec.describe Suggest, type: :model do
  
  describe 'maketag' do
    before do
      @selected_item = Item.create(
        id: 1,
        title: "テスト",
        cr_item: "https://kage-raw.s3-ap-northeast-1.amazonaws.com/CR_%E9%81%A0%E3%81%8F%E3%82%92%E7%9C%BA%E3%82%81%E3%82%8B%E7%94%B7.png",
        dl_item: "https://kage-raw.s3-ap-northeast-1.amazonaws.com/%EF%BC%92%E9%81%A0%E3%81%8F%E3%82%92%E7%9C%BA%E3%82%81%E3%82%8B%E7%94%B7.png"
        )
    end
    example "空白では保存できないこと" do
      @selected_item.suggests.build(suggest_tag: "", item_title: @selected_item.title)
      expect(@selected_item).not_to be_valid
    end
    example "21文字以上では保存できないこと" do
      @selected_item.suggests.build(suggest_tag: "123456789123456789123", item_title: @selected_item.title)
      expect(@selected_item).not_to be_valid
    end
    example "20文字では保存できること" do
      @selected_item.suggests.build(suggest_tag: "12345678912345678912", item_title: @selected_item.title)
      expect(@selected_item).to be_valid
    end
    example "1文字なら保存できること" do
      @selected_item.suggests.build(suggest_tag: "1", item_title: @selected_item.title)
      expect(@selected_item).to be_valid
    end
  end
end