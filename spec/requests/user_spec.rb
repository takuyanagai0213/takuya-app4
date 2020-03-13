require 'rails_helper'

# RSpec.describe "Toppages", type: :request do
#   describe "GET /" do
#     it "HTTPレスポンスが200になる" do
#       get root_url
#       expect(response).to have_http_status(200)
#     end
#   end
# end


RSpec.describe 'UsersController', type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:user_params) { attributes_for(:user, name: 'Updated') }

  describe 'GET #index' do
    subject { get users_path }
    it 'リクエストが成功すること' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    subject { get user_path(user) }
    it 'リクエストが成功すること' do
      is_expected.to eq 200
    end
  end

  describe 'GET #edit' do
    subject { get edit_user_path(user) }
    context 'ログインしている時' do
      before do
        sign_in user
      end
      it 'リクエストが成功すること' do
        is_expected.to eq 200
      end
    end
    context '権限のないユーザの時' do
      before do
        sign_in other_user
      end
      it 'ポスト一覧にリダイレクトすること' do
        is_expected.to redirect_to posts_path
      end
    end
    context 'ゲストの時' do
      it 'ポスト一覧にリダイレクトすること' do
        is_expected.to redirect_to posts_path
      end
    end
  end

  describe 'PATCH #update' do
    subject { patch user_path(user), params: { user: user_params } }
    context 'ログインしている時' do
      before do
        sign_in user
      end
      it '更新できること' do
        expect(subject)
        expect(user.reload.name).to eq user_params[:name]
      end
    end
    context '権限のないユーザとしてログインしている時' do
      before do
        sign_in other_user
      end
      it '更新できないこと' do
        expect(subject)
        expect(user.reload.name).not_to eq user_params[:name]
      end
    end
    context 'ゲストの時' do
      it '更新できないこと' do
        expect(subject)
        expect(user.reload.name).not_to eq user_params[:name]
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete user_path(user) }
    context 'ログインしている時' do
      before do
        sign_in user
      end
      it '削除できること' do
        expect { subject }.to change { User.count }.by(-1)
      end
    end
    context '権限のないユーザとしてログインしている時' do
      before do
        sign_in other_user
      end
      it '削除できないこと' do
        expect { subject }.not_to change { Post.count }
      end
    end
    context 'ゲストの時' do
      it '削除できないこと' do
        expect { subject }.not_to change { Post.count }
      end
    end
  end
end