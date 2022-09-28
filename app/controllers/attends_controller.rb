class AttendsController < ApplicationController
  def create
    @event = Event.find(params[:attend][:event_id])
    if params[:attend][:attendee_id].instance_of?(Array)
      params[:attend].fetch(:attendee_id, []).each do |id|
        @attend = Attend.new(attendee_id: id, event_id: @event.id)
        @attend.save
      end
      redirect_to @event, notice: 'Chosen users has been invited to event!'
    else
      @attend = Attend.new(attend_params)
      @attend.save
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
    params.require(:attend).permit(:event_id, :attendee_id, attendee_id: [])
  end
end
