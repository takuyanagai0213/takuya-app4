
require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:user_post) { create(:post, user: user) }
  let(:post_params) { attributes_for(:post) }

  describe 'GET #index' do
    subject { get posts_path }
    it 'リクエストが成功すること' do
      is_expected.to eq 200
    end
  end

  describe 'GET #show' do
    subject { get post_path(user_post) }
    it 'リクエストが成功すること' do
      is_expected.to eq 200
    end
  end

  describe 'GET #new' do
    subject { get new_post_path }
    context 'ログイン済みの時' do
      before do
        sign_in user
      end
      it 'リクエストが成功すること' do
        is_expected.to eq 200
      end
    end
    context 'ゲストユーザの場合' do
      it 'ログインにリダイレクトすること' do
        is_expected.to eq 302
        is_expected.to redirect_to login_path
      end
    end
  end

  describe 'GET #edit' do
    subject { get edit_post_path(user_post) }
    context 'ログインしているとき' do
      before do
        sign_in user
      end
      it 'リクエストが成功すること' do
        is_expected.to eq 200
      end
    end
    context 'ゲストの時' do
      it 'リダイレクトする' do
        is_expected.to eq 302
        is_expected.to redirect_to login_path
      end
    end
    context '作成者以外のログインユーザがアクセスした時' do
      before do
        sign_in other_user
      end
      it 'リダイレクトする' do
        is_expected.to eq 302
        is_expected.to redirect_to posts_path
      end
    end
  end

  describe 'POST #create' do
    subject { post posts_path, params: { post: post_params } }
    context 'ログインしている時' do
      before do
        sign_in user
      end
      it 'ポストを作成できること' do
        expect { subject }.to change { Post.count }.by(1)
      end
    end
    context 'ゲストの時' do
      it 'ポストが作成されないこと' do
        expect { subject }.not_to change { Post.count }
      end
    end
  end

  describe 'PATCH #update' do
    subject { patch post_path(user_post), params: { post: post_params } }
    context '作成者としてログインしている時' do
      before do
        sign_in user
      end
      it 'ポストを更新できること' do
        expect(subject)
        expect(user_post.reload.title).to eq post_params[:title]
      end
    end
    context 'ゲストの時' do
      it 'ポストが更新されない' do
        expect(subject)
        expect(user_post.reload.title).not_to eq post_params[:title]
      end
      it 'ポスト一覧にリダイレクトする' do
        is_expected.to redirect_to login_path
      end
    end
    context '作成者以外のユーザとしてログインしている時' do
      before do
        sign_in other_user
      end
      it 'ポストが更新されない' do
        expect(subject)
        expect(user_post.reload.title).not_to eq post_params[:title]
      end
      it 'ログインページにリダイレクトする' do
        is_expected.to redirect_to posts_path
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:delete_me_post) { create(:post, user: user) }
    subject { delete post_path(delete_me_post) }
    context '作成者としてログインしている時' do
      before do
        sign_in user
      end
      it 'ポストが削除されること' do
        expect { subject }.to change { Post.count }.by(-1)
      end
    end
    context 'ゲストの時' do
      it 'ポストが削除されない' do
        expect { subject }.not_to change { Post.count }
      end
      it 'ポスト一覧にリダイレクトする' do
        is_expected.to redirect_to login_path
      end
    end
    context 'ゲストの時' do
      before do
        sign_in other_user
      end
      it 'ポストが削除されない' do
        expect { subject }.not_to change { Post.count }
      end
      it 'ログインページにリダイレクトする' do
        is_expected.to redirect_to posts_path
      end
    end
  end
end