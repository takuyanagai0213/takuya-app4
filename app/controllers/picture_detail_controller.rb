class PictureDetailController < ApplicationController
  def index
  end
  
  def new
    @picture = PictureDetail.new
  end
end
