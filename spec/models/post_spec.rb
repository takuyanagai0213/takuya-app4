require 'rails_helper'

RSpec.describe Post, type: :model do
    it 'is invalid with title' do
      user = FactoryBot.create(:user)

      post = user.posts.build(
         title: nil,
         )
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'is invalid with detail' do
      user = FactoryBot.create(:user)

      post = user.posts.build(
         detail: nil,
         )
      post.valid?
      expect(post.errors[:detail]).to include("can't be blank")
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

