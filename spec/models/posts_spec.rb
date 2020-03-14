# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   it 'is valid with title and content' do
#     post = FactoryBot.build(:post)
#     expect(post).to be_valid
#   end

#   it 'is invalid without title' do
#     post = FactoryBot.build(:post, title: nil)
#     post.valid?
#     expect(post.errors[:title]).to include('を入力してください')
#   end

#   it 'is invalid without content' do
#     post = FactoryBot.build(:post, content: nil)
#     post.valid?
#     expect(post.errors[:content]).to include('を入力してください')
#   end

#   it 'is invalid without user' do
#     post = FactoryBot.build(:post, user: nil)
#     post.valid?
#     expect(post.errors[:user]).to include('を入力してください')
#   end

#   it 'cant have many comments' do
#     post = FactoryBot.create(:post, :with_comments)
#     expect(post.comments.length).to eq 5
#   end

#   it 'cant have many likes' do
#     post = FactoryBot.create(:post, :with_likes)
#     expect(post.likes.length).to eq 5
#   end

#   it 'can have many stockitems' do
#     post = FactoryBot.create(:post, :with_stockitems)
#     expect(post.stockitems.length).to eq 5
#   end
# end