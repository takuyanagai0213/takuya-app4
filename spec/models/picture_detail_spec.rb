require 'rails_helper'

RSpec.describe PictureDetail, type: :model do
    
    # 詳細画像がなければ無効な状態であること
    it 'is invalid with image1' do
      picture_detail = FactoryBot.build(:picture_detail, image1: nil,)
      picture_detail.valid?
      expect(picture_detail.errors[:image1]).to include("を入力してください")
    end
  end