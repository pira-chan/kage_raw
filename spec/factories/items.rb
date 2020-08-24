FactoryBot.define do
  factory :item do
    id {1}
    title { "テスト" }
    cr_item { "https://kage-raw.s3-ap-northeast-1.amazonaws.com/CR_%E9%81%A0%E3%81%8F%E3%82%92%E7%9C%BA%E3%82%81%E3%82%8B%E7%94%B7.png" }
    dl_item { "https://kage-raw.s3-ap-northeast-1.amazonaws.com/%EF%BC%92%E9%81%A0%E3%81%8F%E3%82%92%E7%9C%BA%E3%82%81%E3%82%8B%E7%94%B7.png" }
  end
end