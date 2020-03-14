# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe Bookmark, type: :model do
#   it 'is valid if user and post exists' do
#     like = FactoryBot.build(:bookmark)
#     expect(bookmark).to be_valid
#   end

#   it 'is invalid without user' do
#     like = FactoryBot.build(:like, user: nil)
#     like.valid?
#     expect(like.errors[:user]).to include('を入力してください')
#   end

#   it 'is invalid without post' do
#     like = FactoryBot.build(:like, post: nil)
#     like.valid?
#     expect(like.errors[:post]).to include('を入力してください')
#   end
# end
