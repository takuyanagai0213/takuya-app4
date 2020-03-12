require 'rails_helper'

RSpec.describe "Toppages", type: :request do
  describe "GET /" do
    it "HTTPレスポンスが200になる" do
      get root_url
      expect(response).to have_http_status(200)
    end
  end
end