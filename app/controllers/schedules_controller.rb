class SchedulesController < ApplicationController
  before_action :authenticate_user!, except: :index

  
  def index
    @schedules = Schedule.all.order("ending_date DESC")
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def schedule_params
    params.require(:schedule).permit(:start_date, :ending_date, :content, :detail).merge(user_id: current_user.id)
  end

end
