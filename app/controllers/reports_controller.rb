class ReportsController < ApplicationController
  before_action :set_schedule, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @reports = Report.all
  end

  def new
    move_to_index
    @report = Report.new
  end

  def create
    @report = Report.create(report_params)
    if @report.save
      redirect_to schedule_path(@schedule.id)
    else
      render :show
    end
  end

  def show
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to schedule_reports_path(@schedule.id)
    else
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to schedule_reports_path(@schedule.id)
  end



  private
  
  def report_params
    params.require(:report).permit(:image, :text).merge(user_id: current_user.id, schedule_id: params[:schedule_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end
  
  def move_to_index
    unless current_user.id == @schedule.user.id
      redirect_to root_path
    end
  end


  
end
