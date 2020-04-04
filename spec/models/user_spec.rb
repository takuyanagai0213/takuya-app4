require 'rails_helper'

RSpec.describe User, type: :model do
  # 姓、名、メール、パスワードがあれば有効な状態であること
  it "is valid with name, email, and password" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  # 名前がなければ無効な状態であること
  it "is invalid without name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end