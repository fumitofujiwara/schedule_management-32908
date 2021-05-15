class SchedulesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_schedule, only: [:edit, :update, :destroy]
  
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

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to root_path
  end
  


  private

  def schedule_params
    params.require(:schedule).permit(:start_date, :ending_date, :content, :detail).merge(user_id: current_user.id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end


end
