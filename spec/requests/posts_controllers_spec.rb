require 'rails_helper'

RSpec.describe "PostsControllers", type: :request do
  describe "GET /posts_controllers" do
    it "works! (now write some real specs)" do
      get posts_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
