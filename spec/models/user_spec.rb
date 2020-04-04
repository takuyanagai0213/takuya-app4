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
    expect(user.errors[:name]).to include("を入力してください")
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  # パスワードがなければ無効な状態であること
  it "is invalid without an password" do
    user = FactoryBot.build(:user, password: nil )
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  # パスワードが6文字以上出なければ無効な状態であること
  it "is invalid if password is less 6 characters" do
    user = FactoryBot.build(:user, password: 'test')
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "test@example.com")
    user = FactoryBot.build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to iude("はすでに存在します")
  end
end