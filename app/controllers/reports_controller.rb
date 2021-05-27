class ReportsController < ApplicationController
  def new
    @schedule = Schedule.find(params[:schedule_id])
    @report = Report.new
  end

  def create
    @schedule = Schedule.find(params[:schedule_id])
    @report = Report.create(report_params)
    if @report.save
      redirect_to schedule_path(@schedule.id)
    else
      render :show
    end
  end

  def show
    @schedule = Schedule.find(params[:schedule_id])
  end

  private
  
  def report_params
    params.require(:report).permit(:image, :text).merge(user_id: current_user.id, schedule_id: params[:schedule_id])
  end
  
end
