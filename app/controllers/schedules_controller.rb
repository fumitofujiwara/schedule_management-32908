class SchedulesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @schedules = Schedule.all.order("ending_date ASC")
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

  def show
    @schedule_comment = ScheduleComment.new
    @schedule_comments = @schedule.schedule_comments.includes(:user)
  end

  def show_myself
    schedules = Schedule.all
    @schedules = current_user.schedules.order("ending_date ASC")
  end

  def show_everyone
    @schedules = Schedule.all.order("ending_date ASC")
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

  def move_to_index
    unless current_user.id == @schedule.user.id
      redirect_to action: :index
    end
  end
  
end
