# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with email and password' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'is invalid without email' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it 'is invalid without password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include('を入力してください')
  end

  it 'is invalid if password is less 6 characters' do
    user = FactoryBot.build(:user, password: 'test')
    user.valid?
    expect(user.errors[:password]).to include('は6文字以上で入力してください')
  end

  it 'is invalid if email is already taken' do
    FactoryBot.create(:user, email: 'duplicate@email.com')
    user = FactoryBot.build(:user, email: 'duplicate@email.com')
    user.valid?
    expect(user.errors[:email]).to include('はすでに存在します')
  end

  it 'can have many posts' do
    user = FactoryBot.create(:user, :with_posts)
    expect(user.posts.length).to eq 5
  end

  it 'can have many comments' do
    user = FactoryBot.create(:user, :with_comments)
    expect(user.comments.length).to eq 5
  end

  it 'can have many likes' do
    user = FactoryBot.create(:user, :with_likes)
    expect(user.likes.length).to eq 5
  end

  it 'can have many stockitems' do
    user = FactoryBot.create(:user, :with_stockitems)
    expect(user.stockitems.length).to eq 5
  end
end