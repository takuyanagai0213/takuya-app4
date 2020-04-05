FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "釣果タイトルサンプル#{n}" }
    detail { "釣行レポートサンプル" }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    
    trait :with_picture do
      picture { File.new("#{Rails.root}/spec/fixtures/picture.jpg") }
    end
  end
end
