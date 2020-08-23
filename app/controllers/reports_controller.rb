class ReportsController < ApplicationController

  def new
    @report = Report.new
  end
  
  def create
    @report = @reports.build(report_params)
    if @report.save
      flash[:success] = 'お知らせを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'お知らせの投稿に失敗しました。'
      render 'reports/new'
    end
  end

  def edit
  end

  def update
  
  end
  
  def destroy

  end

  private
  def report_params
    params.require(:report).permit(:content)
  end
end