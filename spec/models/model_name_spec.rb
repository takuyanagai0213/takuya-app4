require 'rails_helper'

RSpec.describe ModelName, type: :model do
  it "it vaild with title, detail" do
    user = FactoryBot.create(:user)
    post = Post.new(
      title: "アジがつれました",
      detail: "アジがつれた",
      user_id: 1
      )
    except(post).to be_vaild
  end
end
