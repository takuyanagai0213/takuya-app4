require 'rails_helper'

RSpec.describe User, type: :model do
  # 姓、名、メール、パスワードがあれば有効な状態であること
  it "is valid with name, email, and password" do
    user = User.new(
      name: "Aaron",
      email: "abc@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
    )
    expect(user).to be_valid
  end

  # 名前がなければ無効な状態であること
  it "is invalid without name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end


  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      first_name: "Joe",
      last_name: "Tester",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
    )

    user = User.new(
      first_name: "Jane",
      last_name: "Tester",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end