class ScheduleCommentsController < ApplicationController
  def create
    @schedule = Schedule.find(params[:schedule_id])
    @schedule_comment = ScheduleComment.create(comment_params)
    if @schedule_comment.save
      redirect_to schedule_path(@schedule.id)
    else
      @schedule = @schedule_comment.schedule
      @schedule_comments = @schedule.schedule_comments
      render :'schedules/show'
    end
  end

  private

  def comment_params
    params.require(:schedule_comment).permit(:text).merge(user_id: current_user.id, schedule_id: params[:schedule_id])
  end
end
