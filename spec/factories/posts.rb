FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "釣果タイトルサンプル#{n}" }
    detail { "釣行レポートサンプル" }
    picture { true }
  end
end
