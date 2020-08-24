require "rails_helper"


RSpec.describe Item, type: :model do 
  # ItemとItemSuggestの関連をテスト
  describe 'Association' do
    let(:association) do
       described_class.reflect_on_association(target)
    end
    context 'item_suggests' do
      let(:target) { :item_suggests }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'ItemSuggest' }
    end
  end
  #検索機能をテスト
  describe "Item+Tag" do
    describe "#search" do
      before do
        @item = Item.create(
          title: "男性",
        )
        @item.tags.build(
          adopt_tag: "イケメン",
        )
        @item.save

        @other_item = Item.create(
          title: "女性",
        )
        @other_item.tags.build(
          adopt_tag: "美人",
        )
        @other_item.save
      end
      context "when search with title '男'" do
        example "@itemを返す" do
          expect(Item.search("男")).to include(@item)
        end
        example "@other_itemを返さない" do
          expect(Item.search("男")).to_not include(@other_item)
        end
      end
      context "when search with tag 'イケメン'" do
        example "@itemを返す" do
          expect(Item.search("イケメン")).to include(@item)
        end
        example "@other_itemを返さない" do
          expect(Item.search("イケメン")).to_not include(@other_item)
        end
      end
      context "when search with '動物'" do
        example "空を返す" do
          expect(Item.search("動物")).to be_empty
        end
      end
    end
  end
end
