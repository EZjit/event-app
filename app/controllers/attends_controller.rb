class AttendsController < ApplicationController
  def create
    debugger
    @event = Event.find(params[:attend][:event_id])
    @attend = current_user.attends.new(event_id: @event.id)
    if @attend.save
      redirect_to @event, notice: "You've successfully attended the event!"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @attend = current_user.attends.find_by(event_id: @event.id)
    if @attend.destroy
      redirect_to @event, notice: 'Attend canceled!'
    end
  end

  private

  def attend_params
    params.require(:attend).permit(:attendee_ids)
  end
end
