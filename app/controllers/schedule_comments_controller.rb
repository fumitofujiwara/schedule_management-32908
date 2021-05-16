class ScheduleCommentsController < ApplicationController
  def create
    @schedule = Schedule.find(params[:schedule_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to schedule_path(@schedule.id)
    else
      @schedule = @comment.schedule
      @comments = @schedule.comments
      render :'schedules/show'
    end
  end
end
