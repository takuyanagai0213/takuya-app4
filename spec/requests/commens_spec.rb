# require 'rails_helper'

# RSpec.describe 'CommentsController', type: :request do
#   let(:user) { create(:user) }
#   let(:new_post) { create(:post) }
#   let(:comment_params) { attributes_for(:comment).merge(post_id: new_post.id, user_id: user.id) }

#   before { sign_in user }

#   describe "#create" do
#     subject { post post_comments_path(new_post), params: { comment: comment_params } }
#     it 'コメントが作成されること' do
#       expect { subject }.to change { Comment.count }.by(1)
#     end
#   end
# end