class AttendsController < ApplicationController
  def create
    @event = Event.find(params[:attend][:event_id])
    current_user.attends.create(event_id: @event.id)
    redirect_to @event, notice: "You've successfully attended the event!"
  end

  def destroy
    @event = Event.find(params[:id])
    current_user.attends.find_by(event_id: @event.id).destroy
    redirect_to @event, notice: 'Attend canceled!'
  end
end
