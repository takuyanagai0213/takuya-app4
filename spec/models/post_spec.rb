require 'rails_helper'

RSpec.describe Post, type: :model do

    # タイトルがなければ無効な状態であること
    it 'is invalid with title' do
      post = FactoryBot.build(:user, title: nil,)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    # 釣行レポートがなければ無効な状態であること
    it 'is invalid with detail' do
      post = FactoryBot.build(:user, detail: nil,)
      post.valid?
      expect(post.errors[:detail]).to include("を入力してください")
    end
    
    # タイトル画像がなければ無効な状態であること
    it 'is invalid with picture' do
      post = FactoryBot.build(:user, picture: nil,)
      post.valid?
      expect(post.errors[:picture]).to include("を入力してください")
    end
  end


    # # 二人のユーザーが同じ名前を使うことは許可すること
    # it "allows two users to share a project name" do
    #   user = User.create(
    #     name: "Joe",
    #     email: "joetester@example.com",
    #     password: "dottle-nouveau-pavilion-tights-furze",
    #   )
  
    #   user.posts.create(
    #     title: "Test post",
    #   )
  
    #   other_user = User.create(
    #     name: "Jane",
    #     email: "joetester@example.com",
    #     password: "dottle-nouveau-pavilion-tights-furze",
    #   )
  
    #   other_post = other_user.posts.build(
    #     title: "Test post",
    #   )
      
  
    #   expect(other_post).to_not be_valid
    # end

