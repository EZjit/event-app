class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_event, only: %i[show update edit destroy attend]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Event successfully created!'
    else
      render :new, status: 422
    end
  end

  def index
    @events = Event.all.order(event_date: :desc)
  end

  def show
    @attend = Attend.new
    @attendees = @event.attendees
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event updated and saved!'
    else
      render :edit, status: 422
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path, status: 303, notice: 'Event deleted!'
  end


  private

  def event_params
    params.require(:event).permit(%i[title description location event_date])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
