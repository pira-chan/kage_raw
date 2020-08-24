require "rails_helper"

RSpec.describe ItemSuggest, type: :model do
#   itemモデルとitem_suggestsモデルのアソシエーションをテスト
  describe 'Association' do
    let(:association) do
       described_class.reflect_on_association(target)
    end
    context 'item' do
      let(:target) { :item }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Item' }
    end
  end
end
