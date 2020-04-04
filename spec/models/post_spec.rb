require 'rails_helper'

RSpec.describe Post, type: :model do

    # タイトルがなければ無効な状態であること
    it 'is invalid with title' do
      post = FactoryBot.build(:post, title: nil,)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    # 釣行レポートがなければ無効な状態であること
    it 'is invalid with detail' do
      post = FactoryBot.build(:post, detail: nil,)
      post.valid?
      expect(post.errors[:detail]).to include("を入力してください")
    end
    
    # タイトル画像がなければ無効な状態であること
    it 'is invalid with picture' do
      post = FactoryBot.build(:post, picture: nil,)
      post.valid?
      expect(post.errors[:picture]).to include("を入力してください")
    end
  end